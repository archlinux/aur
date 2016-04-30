set (CMAKE_SYSTEM_NAME pc)

# specify the cross compiler
set (CMAKE_C_COMPILER i686-pc-msdosdjgpp-gcc)
set (CMAKE_CXX_COMPILER i686-pc-msdosdjgpp-g++)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /usr/i686-pc-msdosdjgpp)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Make sure Qt can be detected by CMake
set (QT_BINARY_DIR /usr/i686-pc-msdosdjgpp/bin /usr/bin)
set (QT_INCLUDE_DIRS_NO_SYSTEM ON)

# These are needed for compiling lapack (RHBZ #753906)
set (CMAKE_Fortran_COMPILER i686-pc-msdosdjgpp-gfortran)
set (CMAKE_AR:FILEPATH i686-pc-msdosdjgpp-ar)
set (CMAKE_RANLIB:FILEPATH i686-pc-msdosdjgpp-ranlib)
