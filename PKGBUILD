# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at gmx dot com>

pkgname='tine-outliner-bin'
pkgver=0.9.0
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
sha256sums_x86_64=('19cee1de71d8e672e9b1c7a112cd51f353c26d464fef552539ae1945432ee1c1')
sha256sums_aarch64=('b93b19e646fef50a0978539f6f8fc8fb575ab528f650308bdc70da9a0eb3f12f')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
