# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-bin'
pkgver=0.7.0
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'dbus' 'libx11' 'glib2' 'cairo' 'hicolor-icon-theme')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${_source_base}_amd64.deb")
source_aarch64=("${_source_base}_arm64.deb")
sha256sums_x86_64=('a72578e5df1fda55aaf9e3a4ebdef06e3cffae6f630c4852e9f963cca6d393f9')
sha256sums_aarch64=('27332318e14282d0a8a39c7fba0f57dadf415b3398de62672c66457c8a7ba885')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
