set (CMAKE_SYSTEM_NAME Windows)
set (CMAKE_SYSTEM_PROCESSOR @PROCESSOR@)

# specify the cross compiler
set (CMAKE_C_COMPILER @TRIPLE@-gcc)
set (CMAKE_CXX_COMPILER @TRIPLE@-g++)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /usr/@TRIPLE@)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Make sure Qt can be detected by CMake
set (QT_BINARY_DIR /usr/@TRIPLE@/bin /usr/bin)
set (QT_INCLUDE_DIRS_NO_SYSTEM ON)
set (QT_HOST_PATH "/usr" CACHE PATH "host path for Qt")

# set the resource compiler (RHBZ #652435)
set (CMAKE_RC_COMPILER @TRIPLE@-windres)
set (CMAKE_MC_COMPILER @TRIPLE@-windmc)

# override boost thread component suffix as mingw-w64-boost is compiled with threadapi=win32
set (Boost_THREADAPI win32)

# These are needed for compiling lapack (RHBZ #753906)
set (CMAKE_Fortran_COMPILER @TRIPLE@-gfortran)
set (CMAKE_AR:FILEPATH @TRIPLE@-ar)
set (CMAKE_RANLIB:FILEPATH @TRIPLE@-ranlib)


