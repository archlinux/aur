set (CMAKE_SYSTEM_NAME Windows)
set (CMAKE_SYSTEM_PROCESSOR @CMAKE_PROCESSOR@)

# specify the cross compiler
set (CMAKE_C_COMPILER clang-cl)
set (CMAKE_CXX_COMPILER clang-cl)

# Pin the target before compiler identification — clang-cl otherwise probes as the host
# arch, so CMake records MSVC_*_ARCHITECTURE_ID=x64 and injects /machine:x64 into every
# link line, clashing with our /machine:@PROCESSOR@.
set (CMAKE_C_COMPILER_TARGET @CMAKE_PROCESSOR@-windows-msvc)
set (CMAKE_CXX_COMPILER_TARGET @CMAKE_PROCESSOR@-windows-msvc)

# Use native LLVM COFF tools instead of relying on tools discovered through
# PATH or on Wine-hosted link.exe/lib.exe/mt.exe/rc.exe. In particular, do not
# pass -fuse-ld=lld through add_compile_options(): those options are inherited
# by enabled assembler languages as well and break MASM invocations.
set (CMAKE_AR /usr/bin/llvm-lib CACHE FILEPATH "LLVM COFF librarian" FORCE)
set (CMAKE_LINKER /usr/bin/lld-link CACHE FILEPATH "LLVM COFF linker" FORCE)
set (CMAKE_MT /usr/bin/llvm-mt CACHE FILEPATH "LLVM manifest tool" FORCE)
set (CMAKE_RC_COMPILER /usr/bin/llvm-rc CACHE FILEPATH "LLVM resource compiler" FORCE)
set (CMAKE_C_COMPILER_LINKER /usr/bin/lld-link CACHE FILEPATH "LLVM linker used by the C compiler" FORCE)
set (CMAKE_CXX_COMPILER_LINKER /usr/bin/lld-link CACHE FILEPATH "LLVM linker used by the CXX compiler" FORCE)

# The MSVC assembler wrappers are installed outside PATH. Pick the assembler
# matching each generated toolchain so enable_language(ASM_MASM/ASM_MARMASM)
# does not fall back to an unresolved ml, ml64, or armasm64 command.
if ("@PROCESSOR@" STREQUAL "x86")
    set (CMAKE_ASM_MASM_COMPILER /opt/msvc/bin/@PROCESSOR@/ml CACHE FILEPATH "MSVC x86 assembler" FORCE)
elseif ("@PROCESSOR@" STREQUAL "x64")
    set (CMAKE_ASM_MASM_COMPILER /opt/msvc/bin/@PROCESSOR@/ml64 CACHE FILEPATH "MSVC x64 assembler" FORCE)
elseif ("@PROCESSOR@" STREQUAL "arm64")
    set (CMAKE_ASM_MARMASM_COMPILER /opt/msvc/bin/@PROCESSOR@/armasm64 CACHE FILEPATH "MSVC ARM64 assembler" FORCE)
endif()

add_link_options (/machine:@PROCESSOR@)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /opt/msvc/cmake/find_root/@PROCESSOR@)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

