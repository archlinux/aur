find_path(Stb_INCLUDE_DIR
    NAMES stb_image.h
    PATHS /usr/include/stb
    DOC "Stb include directory"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Stb
    REQUIRED_VARS Stb_INCLUDE_DIR
)

if(Stb_FOUND)
    set(Stb_INCLUDE_DIRS ${Stb_INCLUDE_DIR})
    
    # Create imported target
    if(NOT TARGET Stb)
        add_library(Stb INTERFACE IMPORTED)
        set_target_properties(Stb PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${Stb_INCLUDE_DIR}"
        )
    endif()
endif()

# Mark variables as advanced
mark_as_advanced(Stb_INCLUDE_DIR)
