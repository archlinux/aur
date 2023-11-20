#!/bin/bash
# Copyright (c) 2023 Ho Kim (ho.kim@ulagbulag.io). All rights reserved.
# Use of this source code is governed by a GPL-3-style license that can be
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
    curl -s 'https://www.kakaocorp.com/page/service/service/KakaoTalk' -o 'terms.html'

    # Local-install
    install -Dm755 -t "${pkgdir}/bin" "${srcdir}/kakaotalk"
    install -Dm644 -t "${pkgdir}/share/applications" "${srcdir}/kakaotalk.desktop"
    install -Dm644 -t "${pkgdir}/share/icons/hicolor/256x256/apps" "${srcdir}/kakaotalk.png"
    install -Dm644 -t "${pkgdir}/share/licenses/kakaotalk" "${srcdir}/terms.html"
}

# Execute main function
_install_local "$@" || exit 1
