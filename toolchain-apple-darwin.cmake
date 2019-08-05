set (CMAKE_SYSTEM_NAME Darwin)

# specify the cross compiler
set (CMAKE_C_COMPILER @TRIPLE@-clang)
set (CMAKE_CXX_COMPILER @TRIPLE@-clang++)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH @OSXCROSSDIR@/@TRIPLE@;@PREFIX@)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Make sure Qt can be detected by CMake
set (QT_BINARY_DIR @OSXCROSSDIR@/bin @OSXCROSSDIR@/@TRIPLE@/lib/qt/bin)
set (QT_INCLUDE_DIRS_NO_SYSTEM ON)

set (CMAKE_AR:FILEPATH @TRIPLE@-ar)
set (CMAKE_RANLIB:FILEPATH @TRIPLE@-ranlib)
