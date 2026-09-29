abstract type Task end

for pre in ("AI", "AO", "DI", "DO", "CI", "CO")
    T = Symbol(pre*"Task")
    @eval mutable struct $T <: Task
        th::TaskHandle
        $T(th::TaskHandle) = finalizer(_clear!, new(th))
    end
    @eval $T() = $T(task())
    @eval $T(s::String) = $T(task(s))
end

# finalizers must not throw, so ignore the return code here
function _clear!(t::Task)
    th = t.th
    th == C_NULL && return nothing
    t.th = C_NULL
    DAQmxClearTask(th)
    nothing
end

"""
`clear(task)`

stop the task and release its resources.  Calling `clear` twice is harmless.
"""
function clear(t::Task)
    th = t.th
    th == C_NULL && return nothing
    t.th = C_NULL
    catch_error(DAQmxClearTask(th))
    nothing
end

Base.close(t::Task) = clear(t)
Base.isopen(t::Task) = t.th != C_NULL

# the names of the virtual channels in a task, in the order they were added
task_channels(t::Task) = String.(split(getstring(GetTaskChannels, t.th), ", "))

# how many samples per channel a read with num_samples = -1 should return.
# this mirrors what DAQmx_Val_Auto means for each kind of task, but lets the
# buffer be sized correctly in advance rather than guessed at
function auto_samples(t::Task)
    timing = Ref{Int32}()
    catch_error(GetSampTimingType(t.th, timing))
    timing[] == Val_OnDemand && return 1
    mode = Ref{Int32}()
    catch_error(GetSampQuantSampMode(t.th, mode))
    if mode[] == Val_FiniteSamps
        n = Ref{UInt64}()
        catch_error(GetSampQuantSampPerChan(t.th, n))    # everything the task will acquire
    else
        n = Ref{UInt32}()
        catch_error(GetReadAvailSampPerChan(t.th, n))    # everything buffered right now
    end
    Int(n[])
end

# read `num_samples` per channel from every channel of a task into a freshly
# allocated matrix, one column per channel.  a single channel yields a matrix
# with one column, so the return type does not depend on the task
function _read(t::Task, cfunction::F, ::Type{T}, num_samples::Integer) where {F,T}
    num_channels = Ref{Cuint}()
    catch_error(DAQmxGetTaskNumChans(t.th, num_channels))
    n = num_samples == -1 ? auto_samples(t) : Int(num_samples)
    data = Vector{T}(undef, n*num_channels[])
    num_samples_read = Ref{Int32}(0)
    catch_error( cfunction(t.th,
        Int32(n),
        1.0,
        reinterpret(Bool32, Val_GroupByChannel),
        data,
        UInt32(length(data)),
        num_samples_read,
        reinterpret(Ptr{Bool32}, C_NULL)) )
    resize!(data, num_samples_read[]*num_channels[])
    reshape(data, (Int(num_samples_read[]), Int(num_channels[])))
end

"""
`read!(data, task) -> data`

fill a preallocated vector or matrix with samples from all analog or digital
input channels in a NIDAQ task.  the number of rows is the number of samples
read per channel, and there must be one column per channel.  counter tasks
are not supported, as some counter measurements yield two vectors.
"""
function Base.read!(data::VecOrMat{T}, t::Union{AITask,DITask}) where {T}
    num_channels = Ref{Cuint}()
    catch_error(DAQmxGetTaskNumChans(t.th, num_channels))
    size(data, 2) == num_channels[] ||
        throw(ArgumentError("`data` has $(size(data, 2)) columns but the task has $(num_channels[]) channels"))
    num_samples = size(data, 1)
    num_samples_read = Ref{Int32}(0)
    catch_error( read_cfunction(t, T)(t.th,
        Int32(num_samples),
        1.0,
        reinterpret(Bool32, Val_GroupByChannel),
        data,
        UInt32(length(data)),
        num_samples_read,
        reinterpret(Ptr{Bool32}, C_NULL)) )
    num_samples_read[] == num_samples ||
        error("NIDAQmx: read $(num_samples_read[]) of $num_samples samples per channel")
    return data
end

function task(name::String)
    th = Ref{TaskHandle}(C_NULL)
    catch_error( DAQmxCreateTask(str2code(name), th) )
    th[]
end
task() = task("")

for (cfunction, jfunction) in (
        (DAQmxStartTask, :start),
        (DAQmxStopTask,  :stop))
        
    @eval function $jfunction(t::Task)
        catch_error( $cfunction(t.th) )
        nothing
    end

    @eval @doc $(string("`", jfunction, """(task)`

    """,jfunction," the specified NIDAQ task")) $jfunction
end

