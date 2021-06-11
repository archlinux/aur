VT_VERSION = 3.00
VT_INTRO_VERSION = 1
VT_IS_TEST_VERSION = 0

TEMPLATE = app

DEFINES += VT_VERSION=$$VT_VERSION
DEFINES += VT_INTRO_VERSION=$$VT_INTRO_VERSION
DEFINES += VT_IS_TEST_VERSION=$$VT_IS_TEST_VERSION

CONFIG += c++11

# Debug build (e.g. F5 to reload QML files)
#DEFINES += DEBUG_BUILD

# Bluetooth available
DEFINES += HAS_BLUETOOTH

# CAN bus available
# Adding serialbus to Qt seems to break the serial port on static builds. TODO: Figure out why.
#DEFINES += HAS_CANBUS

# Positioning
DEFINES += HAS_POS

DEFINES += HAS_SERIALPORT

QT       += core gui
QT       += widgets
QT       += printsupport
QT       += network
QT       += quick
QT       += quickcontrols2

contains(DEFINES, HAS_SERIALPORT) {
    QT       += serialport
}

contains(DEFINES, HAS_CANBUS) {
    QT       += serialbus
}

contains(DEFINES, HAS_BLUETOOTH) {
    QT       += bluetooth
}

contains(DEFINES, HAS_POS) {
    QT       += positioning
}


SOURCES += main.cpp\
        mainwindow.cpp \
    packet.cpp \
    udpserversimple.cpp \
    vbytearray.cpp \
    commands.cpp \
    configparams.cpp \
    configparam.cpp \
    vescinterface.cpp \
    parametereditor.cpp \
    digitalfiltering.cpp \
    setupwizardapp.cpp \
    setupwizardmotor.cpp \
    startupwizard.cpp \
    utility.cpp \
    tcpserversimple.cpp

HEADERS  += mainwindow.h \
    packet.h \
    udpserversimple.h \
    vbytearray.h \
    commands.h \
    datatypes.h \
    configparams.h \
    configparam.h \
    vescinterface.h \
    parametereditor.h \
    digitalfiltering.h \
    setupwizardapp.h \
    setupwizardmotor.h \
    startupwizard.h \
    utility.h \
    tcpserversimple.h

FORMS    += mainwindow.ui \
    parametereditor.ui

contains(DEFINES, HAS_BLUETOOTH) {
    SOURCES += bleuart.cpp
    HEADERS += bleuart.h
}

include(pages/pages.pri)
include(widgets/widgets.pri)
include(mobile/mobile.pri)
include(map/map.pri)
include(lzokay/lzokay.pri)

RESOURCES += res.qrc \
    res_fw_bms.qrc \
    res_qml.qrc
RESOURCES += res_config.qrc
RESOURCES += res_original.qrc \
res_fw_original.qrc
DEFINES += VER_ORIGINAL

isEmpty(PREFIX) {
	PREFIX = /usr/local
}
target.path = $${PREFIX}/bin
INSTALLS += target
