set (CMAKE_SYSTEM_NAME Windows)

# specify the cross compiler
set (CMAKE_C_COMPILER /opt/msvc/bin/@PROCESSOR@/cl)
set (CMAKE_CXX_COMPILER /opt/msvc/bin/@PROCESSOR@/cl)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /opt/msvc/cmake/find_root/@PROCESSOR@)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# set the resource compiler
set (CMAKE_RC_COMPILER /opt/msvc/bin/@PROCESSOR@/rc)

# skip c/cxx compiler checks
set (CMAKE_C_COMPILER_WORKS 1)
set (CMAKE_CXX_COMPILER_WORKS 1)
