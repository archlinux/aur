# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-bin'
pkgver=0.7.4
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner (prebuilt release)"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'dbus' 'libx11' 'glib2' 'cairo' 'hicolor-icon-theme')

conflicts=('tine-outliner' 'tine-outliner-git')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${_source_base}_amd64.deb")
source_aarch64=("${_source_base}_arm64.deb")
sha256sums_x86_64=('7e891b7fd721232a3319d2236c37a7de34539eb64d847b702aa9e3780fe6d40d')
sha256sums_aarch64=('e8db916f8876b31e3bc2695fed9ad7a1dcd9d5b23a63e02540ae5d03b3583268')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
