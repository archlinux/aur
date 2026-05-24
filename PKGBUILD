# Maintainer: Jagapathi Gondi <gondijagapathi at gmail dot com>
# Contributor: Raryel C. Souza <raryel.csouza at protonmail dot com>
pkgname=zoom-citrix-plugin
pkgver=6.6.10
_subver=26830
pkgrel=1
pkgdesc="Zoom VDI Citrix plugin "
arch=('x86_64')
license=('custom')
url="https://support.zoom.us/hc/en-us/articles/4415057249549-VDI-releases-and-downloads"
depends=('icaclient')
optdepends=()
replaces=('zoomcitrixplugin')
install=$pkgname.install

source=("https://zoom.us/download/vdi/${pkgver}.${_subver}/zoomvdi-universal-plugin-centos_${pkgver}.rpm")

sha512sums=('9c7203e9b278dfbb9100871a482686fa9e00d652484304700bca13035cfe6c983c392196f170271ea8833a3f8b29dae76971d64d5c84d22a356f527e51ffa2ae')

package() {
    find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

