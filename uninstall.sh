#!/usr/bin/env bash

set -euxo pipefail

TMP_DIR=/tmp/nekuvi/

copy_files() {
    mkdir -p "$TMP_DIR"
    cp /usr/share/X11/xkb/rules/evdev.lst "$TMP_DIR"
    cp /usr/share/X11/xkb/rules/evdev.xml "$TMP_DIR"
}

remove_evdev_lst() {
    pushd "$TMP_DIR"
    sed -i '/np_prog/d' evdev.lst
}

remove_evdev_xml() {
    pushd "$TMP_DIR"
    sed -i '/BEGIN np_prog/,/END np_prog/d' evdev.xml
    popd
}

uninstall_evdev() {
    pushd "$TMP_DIR"
    cp evdev.* /usr/share/X11/xkb/rules/
    popd
}

process() {
    copy_files # copies the necessary files to a temp dir for us
    remove_evdev_lst # modify evdev.lst with np_prog
    remove_evdev_xml # add np_prog to evdev.xml
    uninstall_evdev
}


process
