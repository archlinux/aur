# Get needed values depending on if this is in-tree or out-of-tree
if (NOT SDRPP_CORE_ROOT)
    set(SDRPP_CORE_ROOT "/usr/include/sdrpp_core")
endif ()
if (NOT SDRPP_MODULE_COMPILER_FLAGS)
    # Compiler flags
    if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
        # Debug Flags
        if (MSVC)
            set(SDRPP_MODULE_COMPILER_FLAGS /std:c++17 /EHsc)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            set(SDRPP_MODULE_COMPILER_FLAGS -g -Og -std=c++17 -Wno-unused-command-line-argument -undefined dynamic_lookup)
        else ()
            set(SDRPP_MODULE_COMPILER_FLAGS -g -Og -std=c++17)
        endif ()
    else()
        # Normal Flags
        if (MSVC)
            set(SDRPP_MODULE_COMPILER_FLAGS /O2 /Ob2 /std:c++17 /EHsc)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            set(SDRPP_MODULE_COMPILER_FLAGS -O3 -std=c++17 -Wno-unused-command-line-argument -undefined dynamic_lookup)
        else ()
            set(SDRPP_MODULE_COMPILER_FLAGS -O3 -std=c++17)
        endif ()
    endif()
endif ()

# Created shared lib and link to core
add_library(${PROJECT_NAME} SHARED ${SRC})
target_link_libraries(${PROJECT_NAME} PRIVATE sdrpp_core)
target_include_directories(${PROJECT_NAME} PRIVATE "${SDRPP_CORE_ROOT}/src/" "${SDRPP_CORE_ROOT}/src/imgui/")
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")

# Set compile arguments
target_compile_options(${PROJECT_NAME} PRIVATE ${SDRPP_MODULE_COMPILER_FLAGS})

# Install directives
install(TARGETS ${PROJECT_NAME} DESTINATION lib/sdrpp/plugins)
