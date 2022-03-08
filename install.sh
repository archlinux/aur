#!/usr/bin/env bash

set -euxo pipefail

TMP_DIR=/tmp/nekuvi/

copy_files() {
    mkdir -p "$TMP_DIR"
    cp /usr/share/X11/xkb/rules/evdev.lst "$TMP_DIR"
    cp /usr/share/X11/xkb/rules/evdev.xml "$TMP_DIR"
}

append_evdev_lst() {
    pushd "$TMP_DIR"

    if grep -q "np_prog" evdev.lst; then
        echo "WARNING: evdev.lst already updated. This could mean that you may have tried to install this package previously. Continuing installation."
    else
        sed -i '/! layout/a \ \ np_prog \t Nepali for programmers' evdev.lst
    fi
    popd
}

append_evdev_xml() {
    pushd "$TMP_DIR"
    read -r -d '' np_prog_layout <<EOF || true
<!-- BEGIN np_prog -->
    <layout>
      <configItem>
        <name>np_prog</name>

        <shortDescription>np_prog</shortDescription>
        <description>Nepali for programmers</description>
        <languageList>
          <iso639Id>nep</iso639Id>
        </languageList>
      </configItem>
    </layout>
<!-- END np_prog -->
EOF

    if grep -q "np_prog" evdev.xml; then
        echo "WARNING: evdev.lst already updated. This could mean that you may have tried to install this package previously. Continuing installation."
    else
        awk -v layout="$np_prog_layout" '{ print } /<layoutList>/ { print layout }' evdev.xml > temp.xml
        cp temp.xml evdev.xml
    fi
    popd
}

install_evdev() {
    pushd "$TMP_DIR"
    cp evdev.* /usr/share/X11/xkb/rules/
    popd
}

process() {
    copy_files # copies the necessary files to a temp dir for us
    append_evdev_lst # modify evdev.lst with np_prog
    append_evdev_xml # add np_prog to evdev.xml
    install_evdev
}


process
