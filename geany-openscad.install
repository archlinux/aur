#!/bin/sh

declare -r file='/usr/share/geany/filetype_extensions.conf'
declare -r heading='Extensions'
declare -r category='Script'
declare -r key='OpenSCAD'
declare -r value='*.scad'

post_install() {
    # insert filetype line if it isn't present, otherwise replace it.
    if [ -z "`grep "^${key}=" "${file}"`" ] ; then
        local before="`sed -n "1,/^\[${heading}]/p" "${file}"`"
        local section="`sed "1,/^\[${heading}]/d;/^\s*$/,\\\$d" $file | \
                        cat - <(echo "${key}=${value};") | \
                        sort -f`"
        local after="`sed "1,/^\[${heading}]/d;1,/^\s*$/d" "${file}"`"

        echo -e "${before}\n${section}\n\n${after}" > "${file}"
    else
        sed -i "s/^\(${key}=.*;\)/\1${value};/" "${file}"
    fi
    sed -i "s/^\(${category}=.*\)/\1${key};/" "${file}"
}

pre_remove() {
    # remove the *.scad pattern from the OpenSCAD file type.
    sed -i "s/^\(${key}=.*\)\\${value};/\1/" "${file}"

    # if the OpenSCAD file type has no other patterns,
    # remove it and its entry in the Script group.
    if [ -z "`grep "^${key}=.+" "${file}"`" ] ; then
        sed -i "/^${key}=/d" "${file}"
        sed -i "s/^\(${category}=.*\)${key};\(.*\)$/\1\2/" "${file}"
    fi
}
