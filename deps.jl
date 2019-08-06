
if isdefined((@static VERSION < v"0.7.0-DEV.484" ? current_module() : @__MODULE__), :Compat)
    import Compat.Libdl
elseif VERSION >= v"0.7.0-DEV.3382"
    import Libdl
end
const libarpack = joinpath(dirname(@__FILE__), "usr/lib/libarpack.so")
function check_deps()
    global libarpack
    if !isfile(libarpack)
        error("$(libarpack) does not exist, Please re-run Pkg.build(\"Arpack\"), and restart Julia.")
    end

    if Libdl.dlopen_e(libarpack) in (C_NULL, nothing)
        error("$(libarpack) cannot be opened, Please re-run Pkg.build(\"Arpack\"), and restart Julia.")
    end

end
