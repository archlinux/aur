set( VCPKG_TARGET_ARCHITECTURE @PROCESSOR@ )
set( VCPKG_CRT_LINKAGE dynamic )
set( VCPKG_LIBRARY_LINKAGE dynamic )

if( NOT VCPKG_ROOT_DIR )
    set( VCPKG_ROOT_DIR $ENV{VCPKG_ROOT} )
endif()

set( VCPKG_CHAINLOAD_TOOLCHAIN_FILE ${VCPKG_ROOT_DIR}/scripts/toolchains/windows.cmake )

set( ENV{CC} cl.exe )
set( ENV{CXX} cl.exe )
set( ENV{PATH} "/opt/msvc/bin/@PROCESSOR@:$ENV{PATH}" )