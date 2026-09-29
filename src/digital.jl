for (cfunction, jfunction, ntask) in (
        (CreateDIChan, :digital_input, :DITask),
        (CreateDOChan, :digital_output, :DOTask))
    @eval function $jfunction(channel::String)
      t = $ntask()
      $jfunction(t, channel)
      t
    end
    @eval function $jfunction(t::$ntask, channel::String)
        catch_error( $cfunction(t.th,
                str2code(channel),
                str2code(""),
                Val_ChanPerLine) )
        nothing
    end
end

@doc """
`digital_output(channel) -> task`

`digital_output(task, channel)`

create a digital output channel, and a new NIDAQ task if one is not specified
""" digital_output

@doc """
`digital_input(channel) -> task`

`digital_input(task, channel)`

create a digital input channel, and a new task if one is not specified
""" digital_input

read_digital_cfunctions = Dict{Type,Function}(
    UInt8 => ReadDigitalU8,
    UInt16 => ReadDigitalU16,
    UInt32 => ReadDigitalU32 )

Base.read(t::DITask, num_samples_per_chan::Integer = -1, precision::DataType = UInt32) =
    _read(t, read_digital_cfunctions[precision], precision, num_samples_per_chan)
    
for (cfunction, types) in (
        (WriteDigitalU8,  UInt8),
        (WriteDigitalU16, UInt16),
        (WriteDigitalU32, UInt32))
    @eval function Base.write(t::DOTask, data::Matrix{$types})
        num_samples_per_chan::Int32 = size(data, 1)
        data = reshape(data, length(data))
        num_samples_per_chan_written = Int32[0]
        catch_error( $cfunction(t.th,
            num_samples_per_chan,
            reinterpret(Bool32,UInt32(false)),
            1.0,
            reinterpret(Bool32,Val_GroupByChannel),
            Ref(data,1),
            Ref(num_samples_per_chan_written,1),
            reinterpret(Ptr{Bool32},C_NULL)) )
        num_samples_per_chan_written[1]
    end
    @eval Base.write(t::DOTask, data::Vector{$types}) = 
        Base.write(t, reshape(data, (length(data),1)))
end     
