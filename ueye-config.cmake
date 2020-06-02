set(ueye_MAJOR_VERSION 4)
set(ueye_MINOR_VERSION 93)
set(ueye_PATCH_VERSION 0)
set(ueye_VERSION ${ueye_MAJOR_VERSION}.${ueye_MINOR_VERSION}.${ueye_PATCH_VERSION})

add_library(ueye SHARED IMPORTED)
set_target_properties(ueye PROPERTIES IMPORTED_LOCATION /usr/lib/libueye_api.so.4.93)
