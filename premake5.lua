workspace "stlsplit"
    location "."
    targetdir("build")
    configurations { "Debug", "Release" }
    platforms { "native", "x64", "x32" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
        warnings "Extra"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
        warnings "Extra"

project "lib"
    language "C++"
    kind "SharedLib"
    files { "stlsplit.cpp", "*.h" }
    targetname "stlsplit"
    links { "admesh" }

    filter "system:linux"
        targetextension ".so.1"
        linkoptions { "-Wl,-soname,libstlsplit.so.1" }
        postbuildcommands { "ln -sf libstlsplit.so.1 build/libstlsplit.so" }

    filter "system:macosx"
        targetextension ".1.dylib"
        postbuildcommands { "ln -sf libstlsplit.1.dylib build/libstlsplit.dylib" }

project "cli"
    kind "ConsoleApp"
    language "C++"
    libdirs { "build" }
    files { "cli.cpp" }
    targetname "stlsplit"
    links { "lib", "admesh" }
