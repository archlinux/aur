#!/bin/bash
# Copyright (c) 2023-2024 Ho Kim (ho.kim@ulagbulag.io). All rights reserved.
# Use of this source code is governed by The Unlicense license that can be
# found in the LICENSE file.

# Prehibit errors
set -e -o pipefail

###########################################################
#   Installer                                             #
###########################################################

function _install_local() {
    # Configure
    if [ "$(id -u)" = "0" ]; then
        pkgdir='/usr/local'
    else
        pkgdir="${HOME}/.local"
    fi
    srcdir=$(pwd)

    # Download terms
    curl -s 'https://t1.kakaocdn.net/kakaocorp/pw/policy/files/20260221/%EC%B9%B4%EC%B9%B4%EC%98%A4%20%EC%84%9C%EB%B9%84%EC%8A%A4%20%EC%95%BD%EA%B4%80_20260221_F.pdf' -o 'terms.pdf'

    # Patch "kakaotalk.desktop"
    srcfile="${srcdir}/kakaotalk.desktop"
    tgtfile="$(mktemp -d)/$(basename "${srcfile}")"
    sed "s/^\(Exec=\).*\$/\1${pkgdir//\//\\/}\/bin\/kakaotalk %u/g" "${srcfile}" >"${tgtfile}"

    # Local-install
    install -Dm755 -t "${pkgdir}/bin" "${srcdir}/kakaotalk"
    install -Dm644 -t "${pkgdir}/share/applications" -S "$(basename "${srcfile}")" "${tgtfile}"
    install -Dm644 -t "${pkgdir}/share/icons/hicolor/256x256/apps" "${srcdir}/kakaotalk.png"
    install -Dm644 -t "${pkgdir}/share/licenses/kakaotalk" "${srcdir}/terms.pdf"

    # Cleanup
    rm -f "${tgtfile}"
}

# Execute main function
_install_local "$@"
