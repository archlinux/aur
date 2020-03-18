set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# specify the cross compiler
set(CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)
set(CMAKE_Fortran_COMPILER aarch64-linux-gnu-gfortran)
set(CMAKE_AR:FILEPATH aarch64-linux-gnu-ar)
set(CMAKE_RANLIB:FILEPATH aarch64-linux-gnu-ranlib)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /usr/aarch64-linux-gnu)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
