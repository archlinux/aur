set( CMAKE_SYSTEM_NAME Linux )
# e.g. to use mold with Clang
# set(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=mold")
# set(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=mold")
# set(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=mold")

# e.g. to use mold with Clang
set(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=lld")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=lld")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=lld")

set(CMAKE_CXX_COMPILER "clang++")
set(CMAKE_C_COMPILER "clang")
