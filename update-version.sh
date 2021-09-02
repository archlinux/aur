#!/usr/bin/env bash

project="alsa-capabilities"
PKGBUILD="PKGBUILD"

pkgver_re="^pkgver=(.*)$"
pkgrel_re="^pkgrel=(.*)$"
sha256sums_re="^sha256sums=(.*)$"

declare -A oldvals
declare -A newvals

function printvar() {
    printf "%20s: \`%s'\n" "$1" "$2" 1>&2
}

function get_new_sh256asum() {
    tmp_tarball="$(mktemp "/tmp/${tarball_name}.XXXXXX")"
    wget -O "${tmp_tarball}" "${tarball_url}" > /dev/null 2>&1 
    read -r new_sha256sum < <(sha256sum "${tmp_tarball}" | awk '{ print $1}')
    new_sha256sum="('${new_sha256sum}')"
    printvar "new_sha256sum" "${new_sha256sum}"
    newvals[sha256sums]="${new_sha256sum}"
}


function update_pkgbuild() {
    counter=0
    for fieldname in "${!newvals[@]}"; do
        newval="${newvals[${fieldname}]}"
        oldval="${oldvals[${fieldname}]}"
        if [[ "${oldval}" != "${newval}" ]]; then
            if (( counter == 0 )); then
                printf 1>&2 "updating PKGBUILD:\n"
            fi
            printf 1>&2 " %s:\n < \`%s'\n > \`%s'\n" "${fieldname}" "${oldval}" "${newval}" 
            sed -i "s#^\(${fieldname}\)=\(.*\)#\1=${newval}#" "${PKGBUILD}" || return 1
            ((counter++))
        fi
    done
}


function update_srcinfo() {
    makepkg --printsrcinfo > .SRCINFO
}


read -r new_pkgver < .PKGVER
printvar "new_pkgver" "${new_pkgver}"
newvals[pkgver]="${new_pkgver}"

tarball_name="${project}-${new_pkgver}.tar.gz"
tarball_url="https://gitlab.com/sonida/${project}/-/archive/${new_pkgver}/${project}-${new_pkgver}.tar.gz"

old_sha256sum=""
new_sha256sum=""
new_pkgrel=""

function get_vals() {
    while read -r line; do
        if [[ "${line}" =~ ${pkgver_re} ]]; then
            old_pkgver="${BASH_REMATCH[1]}"
            [[ ${old_pkgver} ]] || return 1
            oldvals[pkgver]="${old_pkgver}"
            printvar "old_pkgver" "${old_pkgver}"
        elif [[ "${line}" =~ ${pkgrel_re} ]]; then
            old_pkgrel="${BASH_REMATCH[1]}"
            [[ ${old_pkgrel} ]] || return 1
            oldvals[pkgrel]="${old_pkgrel}"
            printvar "old_pkgrel" "${old_pkgrel}"
            pkgrel="${old_pkgrel}"
            if [[ "${new_pkgver}" == "${old_pkgver}" ]]; then
                ((pkgrel++))
                new_pkgrel="${pkgrel}"
            else
                new_pkgrel="1"           
            fi
            [[ ${new_pkgrel} ]] || return 1
            printvar "new_pkgrel" "${new_pkgrel}"
            newvals[pkgrel]="${new_pkgrel}"
        elif [[ "${line}" =~ ${sha256sums_re} ]]; then
            old_sha256sum="${BASH_REMATCH[1]}"
            [[ ${old_sha256sum} ]] || return 1
            oldvals[sha256sums]="${old_sha256sum}"
            printvar "old_sha256sum" "${old_sha256sum}"
        fi
    done < PKGBUILD
}

get_vals || exit 1
get_new_sh256asum || exit 1
update_pkgbuild || exit 1
update_srcinfo
#git diff
