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

add_compile_options (-fuse-ld=lld)
add_link_options (/machine:@PROCESSOR@)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /opt/msvc/cmake/find_root/@PROCESSOR@)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# set the resource compiler
set (CMAKE_RC_COMPILER llvm-rc)
set (CMAKE_MT llvm-mt)

