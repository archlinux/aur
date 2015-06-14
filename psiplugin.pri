TEMPLATE = lib
CONFIG += plugin
QT += xml

MOC_DIR = .moc/
OBJECTS_DIR = .obj/
RCC_DIR = .rcc/
UI_DIR = .ui/

INCLUDEPATH += .ui/

target.path = /usr/lib/psi-plus/plugins
INSTALLS += target

INCLUDEPATH += /usr/include/psi-plus/plugins
