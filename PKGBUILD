# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at gmx dot com>

pkgname='tine-outliner-bin'
pkgver=0.9.2
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner (prebuilt release)"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('webkit2gtk-4.1' 'glib2' 'gdk-pixbuf2' 'libsoup3' 'gtk3' 'cairo' 'dbus' 'libgcc' 'libx11' 'hicolor-icon-theme')

conflicts=('tine-outliner' 'tine-outliner-git')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${_source_base}_amd64.deb")
source_aarch64=("${_source_base}_arm64.deb")
sha256sums_x86_64=('1978a75f2ad00beb11b60f90729962d211e36f37b5cb7648ef3d34504ad03ba8')
sha256sums_aarch64=('d046764c1fdd58b7f27ac4d70d16c92d839fb0856367e9ac8515443093d894cf')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
