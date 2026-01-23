#!/bin/sh

export AHF@@VERSION@@_64_HOME="${HOME}"
export AHF@@VERSION@@_64_LIC_PATH="${XDG_CONFIG_HOME:-"${HOME}/.config"}/ahformatter"
export AHF@@VERSION@@_64_BIN_FOLDER="/usr/lib/ahformatter"
export AHF@@VERSION@@_64_LIB_FOLDER="/usr/lib"
export AHF@@VERSION@@_64_ETC_FOLDER="/etc/ahformatter"
export AHF@@VERSION@@_64_HYPDIC_PATH="${AHF@@VERSION@@_64_ETC_FOLDER}/hyphenation"
export AHF@@VERSION@@_64_DEFAULT_HTML_CSS="${AHF@@VERSION@@_64_ETC_FOLDER}/html.css"
export AHF@@VERSION@@_64_FONT_CONFIGFILE="${AHF@@VERSION@@_64_ETC_FOLDER}/font-config.xml"

exec "${AHF@@VERSION@@_64_BIN_FOLDER}/AHFCmd" "$@"
