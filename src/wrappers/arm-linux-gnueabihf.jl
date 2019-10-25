# Autogenerated wrapper script for FLAC_jll for arm-linux-gnueabihf
export metaflac, libflac, flac, libflacpp

using Ogg_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `metaflac`
const metaflac_splitpath = ["bin", "metaflac"]

# This will be filled out by __init__() for all products, as it must be done at runtime
metaflac_path = ""

# metaflac-specific global declaration
function metaflac(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(metaflac_path)
    end
end


# Relative path to `libflac`
const libflac_splitpath = ["lib", "libFLAC.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libflac_path = ""

# libflac-specific global declaration
# This will be filled out by __init__()
libflac_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libflac = "libFLAC.so.8"


# Relative path to `flac`
const flac_splitpath = ["bin", "flac"]

# This will be filled out by __init__() for all products, as it must be done at runtime
flac_path = ""

# flac-specific global declaration
function flac(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(flac_path)
    end
end


# Relative path to `libflacpp`
const libflacpp_splitpath = ["lib", "libFLAC++.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libflacpp_path = ""

# libflacpp-specific global declaration
# This will be filled out by __init__()
libflacpp_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libflacpp = "libFLAC++.so.6"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Ogg_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Ogg_jll.LIBPATH_list,))

    global metaflac_path = abspath(joinpath(artifact"FLAC", metaflac_splitpath...))

    push!(PATH_list, dirname(metaflac_path))
    global libflac_path = abspath(joinpath(artifact"FLAC", libflac_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libflac_handle = dlopen(libflac_path)
    push!(LIBPATH_list, dirname(libflac_path))

    global flac_path = abspath(joinpath(artifact"FLAC", flac_splitpath...))

    push!(PATH_list, dirname(flac_path))
    global libflacpp_path = abspath(joinpath(artifact"FLAC", libflacpp_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libflacpp_handle = dlopen(libflacpp_path)
    push!(LIBPATH_list, dirname(libflacpp_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

