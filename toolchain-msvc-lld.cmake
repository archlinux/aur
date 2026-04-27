# NOTE: link.exe can get stuck under Wine; this MSVC+LLD mix is a workaround.

set (CMAKE_SYSTEM_NAME Windows)
set (CMAKE_SYSTEM_PROCESSOR @CMAKE_PROCESSOR@)

# specify the cross compiler
set (CMAKE_C_COMPILER /opt/msvc/bin/@PROCESSOR@/cl)
set (CMAKE_CXX_COMPILER /opt/msvc/bin/@PROCESSOR@/cl)

# use LLVM COFF tools instead of Wine-hosted link.exe/lib.exe/mt.exe/rc.exe
set (CMAKE_AR /usr/bin/llvm-lib CACHE FILEPATH "LLVM COFF librarian" FORCE)
set (CMAKE_LINKER /usr/bin/lld-link CACHE FILEPATH "LLVM COFF linker" FORCE)
set (CMAKE_MT /usr/bin/llvm-mt CACHE FILEPATH "LLVM manifest tool" FORCE)
set (CMAKE_RC_COMPILER /usr/bin/llvm-rc CACHE FILEPATH "LLVM resource compiler" FORCE)
set (CMAKE_C_COMPILER_LINKER /usr/bin/lld-link CACHE FILEPATH "LLVM linker used by the C compiler" FORCE)
set (CMAKE_CXX_COMPILER_LINKER /usr/bin/lld-link CACHE FILEPATH "LLVM linker used by the CXX compiler" FORCE)

set (CMAKE_EXE_LINKER_FLAGS_INIT "/machine:@PROCESSOR@")
set (CMAKE_SHARED_LINKER_FLAGS_INIT "/machine:@PROCESSOR@")
set (CMAKE_MODULE_LINKER_FLAGS_INIT "/machine:@PROCESSOR@")
set (CMAKE_STATIC_LINKER_FLAGS_INIT "/machine:@PROCESSOR@")
add_link_options (/machine:@PROCESSOR@)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /opt/msvc/cmake/find_root/@PROCESSOR@)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# skip c/cxx compiler checks
set (CMAKE_C_COMPILER_WORKS 1)
set (CMAKE_CXX_COMPILER_WORKS 1)
