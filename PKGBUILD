# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-bin'
pkgver=0.6.986
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64' 'aarch64')
depends=('gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'dbus' 'libx11' 'glib2' 'cairo' 'hicolor-icon-theme')

_source_base="https://github.com/martinkoutecky/tine/releases/download/v${pkgver}/Tine_${pkgver}"
source_x86_64=("${_source_base}_amd64.deb")
source_aarch64=("${_source_base}_arm64.deb")
sha256sums_x86_64=('5cd33d9d6bb6b33a6c357b103fe9524d30037f107addcdd383b924481b1f8d11')
sha256sums_aarch64=('264e7247c9f564773e0ae7b7c0a1a1c058437c589c03b5aa73bc168efb203c0e')

function package {
  tar -xf data.tar.gz -C "${pkgdir}"
}
