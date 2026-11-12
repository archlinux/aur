# Maintainer: Cabel <mxzcabel at tuta dot com>

# ———————————————————————————— NOTICE ————————————————————————————————————
# Chatto
# Copyright 2026 ChattoCorp GmbH
# 
# The frontend call join and leave tones are original Chatto assets, licensed
# under Apache-2.0. They contain no third-party recordings.
# 
# This product includes third-party open source software. This notice lists
# direct dependencies, shipped browser assets, and upstream NOTICE text known to
# apply to the Chatto server, CLI, frontend, and documentation website.
# 
# Dependency manifests and lockfiles in this repository remain the authoritative
# set of third-party packages, including transitive dependencies, used to build
# each artifact.

# The experimental Gobotto bot and Chatto Go SDK also use the Gorilla WebSocket,
# Go Protobuf, Bubble Tea, Lip Gloss, and go-toml dependencies listed below.
# Gobotto uses robfig/cron (https://github.com/robfig/cron), licensed under the
# MIT License, for recurring task schedules (Copyright 2012 Rob Figueiredo).
# Gobotto also uses golang.org/x/image (BSD 3-Clause License) for image resizing
# and WebP decoding before model requests.
# Gobotto embeds means (https://github.com/hmans/means), licensed under the
# Apache License 2.0 (Copyright 2026 the means contributors), for Markdown
# collections. It also uses means' Bleve search and JSON Schema dependencies.
# Gobotto uses Glamour (https://github.com/charmbracelet/glamour), licensed under
# the MIT License, to render brain document bodies and instructions locally.
# Gobotto uses fsnotify (https://github.com/fsnotify/fsnotify), licensed under
# the BSD 3-Clause License, to refresh its local brain browser after file changes.
# The experimental Chatty terminal client also uses Bubble Tea, Bubbles, Lip Gloss,
# and the Chatto Go SDK. It uses Glamour (https://github.com/charmbracelet/glamour),
# licensed under the MIT License, to render Markdown locally.
# Chatty also uses golang.org/x/image (BSD 3-Clause License) for image preview
# resizing and WebP decoding, and Charm's x/ansi (MIT License) for Kitty graphics.
# It uses goldmark-emoji (https://github.com/yuin/goldmark-emoji), licensed under
# the MIT License, to display named emoji reactions as Unicode.
#
# Slack conversion data:
#
# - emoji-data (https://github.com/iamcal/emoji-data) - MIT License
#  Copyright (c) 2013 Cal Henderson. Generated alias and skin-tone mappings only;
#  no upstream image assets are included.
#
# ChattoBot:
#
# - Paseo client SDK (https://github.com/getpaseo/paseo) - Apache License 2.0
# - LinkeDOM (https://github.com/WebReflection/linkedom) - ISC License
#
#
# Desktop Components:
#
# - electron-builder (https://www.electron.build/) - MIT License
# (Windows installer, macOS disk-image, and Linux AppImage packaging)
# - electron-updater (https://www.electron.build/) - MIT License. Bundled
#  dependency licence texts are in app.asar/updater-licenses.txt.
# - esbuild (https://github.com/evanw/esbuild) - MIT License (build tool)
# - macOS disk-image background artwork (`apps/desktop/icons/background*.png`) -
#   Apache License 2.0, as specified in REUSE.toml
# - NSIS (https://nsis.sourceforge.io/) - zlib/libpng License; installer components
#   include bzip2 and LZMA code under their respective licences
# 
# - Electron (https://www.electronjs.org/) - MIT License; Copyright OpenJS
#   Foundation and Electron contributors
# - LiveKit client SDK for Swift (https://github.com/livekit/client-sdk-swift) -
#   Apache License 2.0; Copyright 2023 LiveKit, Inc.
# - LiveKit UniFFI XCFramework
#   (https://github.com/livekit/livekit-uniffi-xcframework) - Apache License 2.0
# - LiveKit WebRTC XCFramework (https://github.com/livekit/webrtc-xcframework) -
#   MIT License; Copyright 2021 WebRTC SDKs; bundled WebRTC is BSD 3-Clause and
#   includes third-party components under their respective licences
# - nanopb (https://github.com/nanopb/nanopb), bundled by the LiveKit Swift SDK -
#   zlib License; Copyright 2011 Petteri Aimonen
# - Chromium (https://www.chromium.org/) - BSD 3-Clause License and other
#   licences included in Electron's bundled `LICENSES.chromium.html`
#
# Upstream NOTICE Text:
# 
# CoreOS go-oidc:
# CoreOS Project
# Copyright 2014 CoreOS, Inc
# This product includes software developed at CoreOS, Inc. (http://www.coreos.com/).
# 
# LiveKit Protocol:
# Copyright 2023 LiveKit, Inc.
# 
# AWS SDK for Go:
# AWS SDK for Go
# Copyright 2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# Copyright 2014-2015 Stripe, Inc.
# 
# Prometheus Go client:
# Prometheus instrumentation library for Go applications
# Copyright 2012-2015 The Prometheus Authors
# This product includes software developed at SoundCloud Ltd.
# (http://soundcloud.com/).
# 
# Twirp:
# Twirp
# Copyright 2018 Twitch Interactive, Inc. All Rights Reserved.
# 
# Trademark Notice:
# Chatto's source code uses mixed licensing. The default repository license is
# the GNU Affero General Public License version 3 or any later version, with
# Apache License 2.0 exceptions for the independently versioned shared framework
# modules and selected frontend, integration, and documentation surfaces, and
# MIT License exceptions for Runling and ChattoBot under `packages/`,
# as annotated in REUSE.toml. These licenses do not grant permission to use the
# "Chatto" name, Chatto logos, or other Chatto marks except as otherwise
# permitted by law. "Chatto" and the Chatto logos are marks and trade names of
# ChattoCorp GmbH, and are not registered trademarks at this time.
# 
# You may truthfully refer to Chatto to describe the origin of the software, for
# example by saying that a project is "based on Chatto" or "forked from Chatto".
# You may not use the Chatto name, logos, or marks in a way that suggests your
# project, service, distribution, or modified version is official, endorsed by,
# sponsored by, or operated by ChattoCorp GmbH unless you have separate written
# permission.
# 
# 
# ————————————————————————————— PKGBUILD —————————————————————————————————
pkgname=chatto-desktop-bin
pkgver=0.5.0
pkgrel=2
pkgdesc='Team and group chat desktop application'
arch=('x86_64' 'arm64')
url="https://github.com/chattocorp/chatto"
license=('AGPL-3.0',' Apache-2.0',' MIT ',' OFL',' Unicode')
provides=('chatto-desktop')
conflicts=('chatto-desktop')
depends=('vulkan-icd-loader')
source_x86_64=("https://github.com/chattocorp/chatto/releases/download/v${pkgver}/${provides}_${pkgver}_Linux_X64.tar.gz")
source_arm64=("https://github.com/chattocorp/chatto/releases/download/v${pkgver}/${provides}_${pkgver}_Linux_ARM64.tar.gz")
source=('chatto-desktop.desktop')
install='chatto-desktop.install'
sha256sums_x86_64=('40d01de1a3f6a230f69f6369ddb3bf03734ee9eb6547c26b4ee1163325ecebc4')
sha256sums_arm64=('a1aaeb591ef6c3b29b9454b2b2f09cb0d72fdc88249e688f9124888361fc92ba')
sha256sums=('43e3c9b72fc187f6c0b3c9515369513258426c0642e202982efac337e43eb84f')

package() {  
    bsdtar -C "${pkgdir}" -xf ${provides}_${pkgver}_*.tar.gz
    _licenses=$(printf "%s\n" $(ls ${pkgdir}/${provides}/resources/LICENSES/))
    _libvk_swiftshader="libvk_swiftshader.so"
    _libffmpeg="libffmpeg.so"
    _libvulkan="libvulkan.so.1"
    _icons_dir_src="resources/build/icons"
    _icons_dir_dst="usr/share/icons/hicolor"

    #---------------- LIBRARIES
    install "${pkgdir}/${provides}/${_libvk_swiftshader}" -Dm755 -t "${pkgdir}/usr/lib/${provides}/"
    install "${pkgdir}/${provides}/${_libffmpeg}" -Dm755 -t "${pkgdir}/usr/lib/${provides}/"

    #---------------- LICENSES
    mapfile -t _licenses_list <<< ${_licenses[0]}
    _licenses_list=$(printf "%s\n" "${_licenses_list[*]}")

    for license in ${_licenses_list[@]} ; do 
      install "${pkgdir}/${provides}/resources/LICENSES/${license}" -Dm644 -t "${pkgdir}/usr/share/licenses/${provides}/"
    done
    install "${pkgdir}/${provides}/LICENSE" -m 644 "${pkgdir}/usr/share/licenses/${provides}/${provides}_license.txt"
    install "${pkgdir}/${provides}/LICENSES.chromium.html" -Dm644 -t "${pkgdir}/usr/share/licenses/${provides}/"

    #---------------- ICONS
    mkdir -p "${pkgdir}/$_icons_dir_dst/32x32/apps"
    mkdir -p "${pkgdir}/$_icons_dir_dst/96x96/apps"
    mkdir -p "${pkgdir}/$_icons_dir_dst/180x180/apps"
    mkdir -p "${pkgdir}/$_icons_dir_dst/192x192/apps"
    mkdir -p "${pkgdir}/$_icons_dir_dst/512x512/apps"
    mkdir -p "${pkgdir}/$_icons_dir_dst/192x192@2/apps"
    mkdir -p "${pkgdir}/$_icons_dir_dst/512x512@2/apps"

    install "${pkgdir}/${provides}/$_icons_dir_src/favicon.png" -m 644 "${pkgdir}/$_icons_dir_dst/32x32/apps/${provides}.png"
    install "${pkgdir}/${provides}/$_icons_dir_src/notification-badge.png" -m 644 "${pkgdir}/$_icons_dir_dst/96x96/apps/${provides}.png"
    install "${pkgdir}/${provides}/$_icons_dir_src/apple-touch-icon.png" -m 644 "${pkgdir}/$_icons_dir_dst/180x180/apps/${provides}.png"
    install "${pkgdir}/${provides}/$_icons_dir_src/icon-192.png" -m 644 "${pkgdir}/$_icons_dir_dst/192x192/apps/${provides}.png"
    install "${pkgdir}/${provides}/$_icons_dir_src/icon-512.png" -m 644 "${pkgdir}/$_icons_dir_dst/512x512/apps/${provides}.png"
    install "${pkgdir}/${provides}/$_icons_dir_src/icon-maskable-192.png" -m 644 "${pkgdir}/$_icons_dir_dst/192x192@2/apps/${provides}.png"
    install "${pkgdir}/${provides}/$_icons_dir_src/icon-maskable-512.png" -m 644 "${pkgdir}/$_icons_dir_dst/512x512@2/apps/${provides}.png"

    #---------------- DESKTOP
    install "${provides}.desktop" -Dm644 -t "${pkgdir}/usr/share/applications/"
    
    #---------------- /OPT
    mkdir "${pkgdir}/opt/"
    cp --preserve=timestamps -r "${pkgdir}/${provides}" "${pkgdir}/opt/"

    rm "${pkgdir}/opt/${provides}/resources/NOTICE" "${pkgdir}/opt/${provides}/LICENSE" "${pkgdir}/opt/${provides}/LICENSES.chromium.html"
    rm "${pkgdir}/opt/${provides}/resources/LICENSE" "${pkgdir}/opt/${provides}/resources/LICENSES.chromium.html"
    rm "${pkgdir}/opt/${provides}/${_libvk_swiftshader}" "${pkgdir}/opt/${provides}/${_libffmpeg}" "${pkgdir}/opt/${provides}/${_libvulkan}"
    rm -r "${pkgdir}/opt/${provides}/resources/LICENSES" "${pkgdir}/opt/${provides}/resources/build/icons"
    rm -r "${pkgdir}/${provides}"


    #---------------- SYMBOLIC LINK
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/${provides}/${provides}" "${pkgdir}/usr/bin/${provides}"
    chmod 711 "${pkgdir}/opt/${provides}"
}
