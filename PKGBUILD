# Maintainer: Jagapathi Gondi <gondijagapathi at gmail dot com>
# Contributor: Raryel C. Souza <raryel.csouza at protonmail dot com>
pkgname=zoom-citrix-plugin
pkgver=6.3.10
_subver=25910
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

sha512sums=('6551ebb8b080787c9404cbb55a2ac196a32b4248260bde77d3750ab012f056813f4f805973f0061639b73193952a0f0c34f3b43675e860c131cbe58e8e1044b0')

package() {
    find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

