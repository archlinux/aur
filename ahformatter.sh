#!/bin/sh

export AHF74_64_HOME="${HOME:-/home/$(id -un)}"

mkdir -p "${XDG_CONFIG_HOME:-"$HOME/.config"}/ahformatter"
export AHF74_64_LIC_PATH="${XDG_CONFIG_HOME:-"$HOME/.config"}/ahformatter"

export AHF74_64_BIN_FOLDER="/usr/bin"
export AHF74_64_LIB_FOLDER="/usr/lib"
export AHF74_64_ETC_FOLDER="/etc/ahformatter"

export AHF74_64_HYPDIC_PATH="${AHF74_64_ETC_FOLDER}/hyphenation"
export AHF74_64_DEFAULT_HTML_CSS="${AHF74_64_ETC_FOLDER}/html.css"
export AHF74_64_FONT_CONFIGFILE="${AHF74_64_ETC_FOLDER}/font-config.xml"

exec "${AHF74_64_BIN_FOLDER}/AHFCmd" "$@"
