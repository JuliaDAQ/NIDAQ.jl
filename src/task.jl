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

