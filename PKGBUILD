# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at gmx dot com>

pkgname='tine-outliner-bin'
pkgver=0.9.1
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
sha256sums_x86_64=('bbb39e4c18b9f409f61cdac157c90c9fbf87fd0567cb3d031453a404b39af64e')
sha256sums_aarch64=('afb986e66d4b847861eb822aa1272c86e7236ffeb6ab530e9f5da16527af9bcc')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
