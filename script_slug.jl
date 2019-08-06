
## From https://github.com/cdluminate/DistroHelper.jl

using Pkg

function slug(package::AbstractString, versions::AbstractString, version::Any = nothing)
    if !any(map(isfile, (package, versions)))
        uuid = Base.UUID(package)
        sha1 = Base.SHA1(hex2bytes(versions))
    else
        Package  = Pkg.TOML.parsefile(package)
        Versions = Pkg.TOML.parsefile(versions)
        latest_ver = maximum(VersionNumber.(keys(Versions)))
        version = string((version == nothing) ? latest_ver : version)
        uuid = Base.UUID(Package["uuid"])
        sha1 = Base.SHA1(hex2bytes(Versions[version]["git-tree-sha1"]))
    end
    return Base.version_slug(uuid,sha1)
end

println(slug(ARGS...))
