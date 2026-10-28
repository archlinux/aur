# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-bin'
pkgver=0.8.1
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
sha256sums_x86_64=('96e69e0aeaf889e7d4bd868c6ee0823875c7456b40be2a5d48aaf00e3232f5dd')
sha256sums_aarch64=('e6e18464e27977a167cd1271cb77f0bad0996a4e04b9e12336a454a220c39c24')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
