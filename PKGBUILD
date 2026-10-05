# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-bin'
pkgver=0.6.987
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'dbus' 'libx11' 'glib2' 'cairo' 'hicolor-icon-theme')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${_source_base}_amd64.deb")
source_aarch64=("${_source_base}_arm64.deb")
sha256sums_x86_64=('970aa0c35f628aa387f0e584db7b858abc80736efb5875b8501d5b90408eb716')
sha256sums_aarch64=('7505528f053e0aa7d3d07d3947cf2fae62aaf98d97ef0221ec4e94ae9e21cd7d')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
