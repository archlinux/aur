add_library(nlohmann_json::nlohmann_json INTERFACE IMPORTED)

set_target_properties(nlohmann_json::nlohmann_json PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES /usr/include
)
