"""
`devices() -> Vector{String}`

get a list of available NIDAQ devices
"""
function devices()
    sz = GetSysDevNames(Ref{Cchar}(C_NULL), UInt32(0))
    data=zeros(Cchar,sz)
    catch_error(GetSysDevNames(Ref(data,1), UInt32(sz)))
    devs = map((x)->convert(String,x), split(safechop(ascii(String(UInt8.(data)))),", "))
    devs[devs .!= ""]
end

for (jfunction, cfunction) in (
        (:analog_input_channels, GetDevAIPhysicalChans),
        (:analog_output_channels, GetDevAOPhysicalChans),
        (:digital_input_channels, GetDevDILines),
        (:digital_output_channels, GetDevDOLines),
        (:counter_input_channels, GetDevCIPhysicalChans),
        (:counter_output_channels, GetDevCOPhysicalChans))
    @eval function $jfunction(device::String)
        sz = $cfunction(str2code(device), Ref{Cchar}(C_NULL), UInt32(0))
        data=zeros(Cchar,sz)
        catch_error( $cfunction(str2code(device), Ref(data,1),
                UInt32(sz)) )
        map((x)->convert(String,x), split(safechop(ascii(String(UInt8.(data)))),", "))
        
    end

    @eval function $jfunction()
        d = devices()
        length(d)!=1 && error("NIDAQmx: more than one device")
        $(Symbol(jfunction))(d[1])
    end

    @eval @doc $(string("`", jfunction, """() -> Vector{String}`

    `""", jfunction, """(device) -> Vector{String}`

    get a list of available channels for either the only available NIDAQ device or for the specified NIDAQ device
    """)) $jfunction
end

for (jfunction, cfunction) in (
        (:analog_voltage_input_ranges,  GetDevAIVoltageRngs),
        (:analog_voltage_output_ranges, GetDevAOVoltageRngs),
        (:analog_current_input_ranges,  GetDevAICurrentRngs), 
        (:analog_current_output_ranges, GetDevAOCurrentRngs))
        
    @eval function $jfunction(device::String)
        sz = $cfunction(str2code(device), convert(Ptr{Float64},C_NULL), UInt32(0))
        data=zeros(sz)
        catch_error( $cfunction(str2code(device), Ref(data,1),
                UInt32(sz)) )
        reshape(data,(2,length(data)>>1))'
    end

    @eval function $jfunction()
        d = devices()
        length(d)!=1 && error("NIDAQmx: more than one device")
        $jfunction(d[1])
    end

    @eval @doc $(string("`", jfunction, """() -> Matrix`

    `""", jfunction, """(device) -> Matrix`

    get a list of available ranges for either the only available NIDAQ device or for the specified NIDAQ device
    """)) $jfunction
end

"""
`channel_type(task,channel) -> channel_type, measurement/output_type`

get the type of the specified NIDAQ channel
"""
function channel_type(t::Task, channel::String)
    val1 = Cint[0]
    catch_error(
        GetChanType(t.th, str2code(channel), Ref(val1,1)) )

    val2 = Cint[0]
    if val1[1] == Val_AI
        ret = GetAIMeasType(t.th, str2code(channel), Ref(val2,1))
    elseif val1[1] == Val_AO
        ret = GetAOOutputType(t.th, str2code(channel), Ref(val2,1))
    elseif val1[1] == Val_DI || val1[1] == Val_DO
        return val1[1], nothing
    elseif val1[1] == Val_CI
        ret = GetCIMeasType(t.th, str2code(channel), Ref(val2,1))
    elseif val1[1] == Val_CO
        ret = GetCOOutputType(t.th, str2code(channel), Ref(val2,1))
    end
    catch_error(ret)

    val1[1], val2[1]
end

function _getproperties(args, suffix::String, warning::Bool)
    ret_val = Dict{String,Tuple{Any,Bool}}()
    local settable
    local data
    local ret
    for sym in names(NIDAQ, all=true)
        eval(:(!(typeof(NIDAQ.$sym) <:Function))) && continue
        if string(sym)[1:min(end,8+length(suffix))]=="DAQmxGet"*suffix
            cfunction = getfield(NIDAQ, sym)
            ccall_args = code_lowered(cfunction)[1].code[end-1].args[3]
            try
                basetype = eltype(ccall_args[1+length(args)])
                if length(ccall_args)==1+length(args)
                    data = Ref{basetype}(0)
                    ret = cfunction(args..., data)
                    data = data[]
                else
                    sz = cfunction(args..., convert(Ptr{basetype},C_NULL), convert(UInt32,0))
                    if sz<0
                      ret=sz
                      throw()
                    end
                    data = zeros(basetype,sz)
                    ret = cfunction(args..., Ref(data,1), convert(UInt32,sz))
                end
                if ret!=0
                    throw()
                elseif basetype == Bool32
                    data = reinterpret(UInt32, data) != 0
                elseif basetype == Int32
                    try
                        data = map((x)->signed_constants[x], data)
                    catch
                    end
                elseif basetype == UInt32
                    try
                        data = map((x)->unsigned_constants[x], data)
                    catch
                    end
                elseif basetype == Int8
                    data = split(safechop(ascii(String(UInt8.(data)))),", ")

                end
            catch
                if warning
                    if ret!=0
                        catch_error(ret, string(cfunction)*": ", err_fcn=x->@warn(x))
                    else
                        @warn("can't handle function signature for $cfunction: $ccall_args")
                    end
                end
                continue
            end
            try
                getfield(NIDAQ, Symbol(replace(string(cfunction),"Get"*suffix =>"Set"*suffix)))
                settable=true
            catch
                settable=false
            end
	        n_skip = VERSION >= v"1.2" ? 9 : 15
            ret_val[string(cfunction)[n_skip+length(suffix):end]] = (data, settable)
        end
    end
    ret_val
end

"""
`getproperties(warning=false) -> Dict`

get the NIDAQ system properties
"""
function getproperties(; warning=false)
    _getproperties((), "Sys", warning)
end

"""
`getproperties(device; warning=false) -> Dict`

get the properties of the specified NIDAQ device
"""
function getproperties(device::String; warning=false)
    _getproperties((str2code(device),), "Dev", warning)
end

"""
`getproperties(task; warning=false) -> Dict`

get the properties of the specified NIDAQ task
"""
function getproperties(t::Task; warning=false)
    _getproperties((t.th,), "Task", warning)
end

channel_types = ["Val_AI", "Val_AO",
                 "Val_DI", "Val_DO",
                 "Val_CI", "Val_CO"]

"""
`getproperties(task,channel; warning=false) -> Dict`

get the properties of the specified NIDAQ channel
"""
function getproperties(t::Task, channel::String; warning=false)
    kind = channel_types[ findall(channel_type(t, channel)[1] .==
            map((x)->getfield(NIDAQ,Symbol(x)), channel_types))[1]][end-1:end]

    _getproperties((t.th, str2code(channel)), kind, warning)
end

"""
`setproperty!(task,channel,property,value)`

set the specified NIDAQ property to value
"""
function Base.setproperty!(t::Task, channel::String, property::String, value)
    kind = channel_types[ findall(channel_type(t, channel)[1] .==
            map((x)->getfield(NIDAQ,Symbol(x)), channel_types))[1]][end-1:end]

    @eval ret = $(Symbol("DAQmxSet"*kind*property))($t.th, str2code($channel), $value)
    catch_error(ret, "DAQmxSet$kind$property: ")
    nothing
end
