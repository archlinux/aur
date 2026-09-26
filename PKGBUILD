# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-bin'
pkgver=0.6.984
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'dbus' 'libx11' 'glib2' 'cairo' 'hicolor-icon-theme')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${_source_base}_amd64.deb")
source_aarch64=("${_source_base}_arm64.deb")
sha256sums_x86_64=('ab5eac973c5b4291801de19a416e864f95d98d6f81c82baef3cdc7861f847766')
sha256sums_aarch64=('4c34cd1393fa271e6dca295c1759764fbe3cbe3c5e73d8f0e72cb25bd9ebba03')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}

# vim: ft=sh
