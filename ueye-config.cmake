set(ueye_MAJOR_VERSION 4)
set(ueye_MINOR_VERSION 96)
set(ueye_PATCH_VERSION 1)
set(ueye_VERSION ${ueye_MAJOR_VERSION}.${ueye_MINOR_VERSION}.${ueye_PATCH_VERSION})

add_library(ueye SHARED IMPORTED)
set_target_properties(ueye PROPERTIES IMPORTED_LOCATION /usr/lib/libueye_api.so.1)
