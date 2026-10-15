# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-bin'
pkgver=0.7.3
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner (prebuilt release)"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'dbus' 'libx11' 'glib2' 'cairo' 'hicolor-icon-theme')

conflicts=('tine-outliner')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${_source_base}_amd64.deb")
source_aarch64=("${_source_base}_arm64.deb")
sha256sums_x86_64=('4879b8c69e20f12234962e09b28c0aa736ec97d401fd705f60342934305c651e')
sha256sums_aarch64=('34030eaf0d4ccc4105c9e3acb189d319fc20780c982e11ecb53d503cfbe1465c')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
