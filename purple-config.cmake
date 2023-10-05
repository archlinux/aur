cmake_minimum_required(VERSION 3.18) # see win32 subdirectory

# Try pkg-config first (the default on Linux).
# Note: On win32, pkg-config may be provided by MinGW or MSYS.
find_package(PkgConfig QUIET)
if (${PKG_CONFIG_FOUND})
    pkg_check_modules(PURPLE purple)
    pkg_get_variable(PURPLE_PLUGIN_DIR purple plugindir)
    pkg_get_variable(PURPLE_DATA_DIR purple datarootdir)
endif()
if(WIN32 AND NOT "${PURPLE_FOUND}")
    message(STATUS "Trying win32 auto-configuration...")
    include(${CMAKE_CURRENT_LIST_DIR}/win32/purple-fetch.cmake)
endif()
if(NOT "${PURPLE_FOUND}")
    message(FATAL_ERROR "Purple not found.")
endif()
