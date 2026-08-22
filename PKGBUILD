# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-bin'
pkgver=0.6.93
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('webkit2gtk-4.1' 'gtk3')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.deb::${_source_base}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-${CARCH}.deb::${_source_base}_arm64.deb")
sha256sums_x86_64=("863cffa13fa0cf5de1b20315f291364a55779c1e53e63c344d333f10fb7a678d")
sha256sums_aarch64=("c75888f13441857946181d505873d83bab5559dadfca3900ff66364f2ce68993")

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}

# vim: ft=sh
