# NOTE: link.exe can get stuck under Wine; this MSVC+LLD triplet is a workaround.

set( VCPKG_TARGET_ARCHITECTURE @PROCESSOR@ )
set( VCPKG_CRT_LINKAGE dynamic )
set( VCPKG_LIBRARY_LINKAGE dynamic )
set( VCPKG_ENV_PASSTHROUGH PATH )

set( VCPKG_CMAKE_SYSTEM_NAME Windows )

set( VCPKG_CHAINLOAD_TOOLCHAIN_FILE "/opt/msvc/cmake/toolchain-@PROCESSOR@-lld.cmake" )
set( VCPKG_LOAD_VCVARS_ENV ON ) # Setting VCPKG_CHAINLOAD_TOOLCHAIN_FILE deactivates automatic vcvars setup so reenable it!
