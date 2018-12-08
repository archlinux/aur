
add_library(Qt5::QPbfPlugin MODULE IMPORTED)

_populate_Gui_plugin_properties(QPbfPlugin RELEASE "imageformats/libpbf.so")

list(APPEND Qt5Gui_PLUGINS Qt5::QPbfPlugin)
