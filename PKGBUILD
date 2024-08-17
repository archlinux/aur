# Maintainer: Jagapathi Gondi <gondijagapathi at gmail dot com>
# Contributor: Raryel C. Souza <raryel.csouza at protonmail dot com>
pkgname=zoom-citrix-plugin
pkgver=5.16.11
_subver=24500
pkgrel=3
pkgdesc="Zoom VDI Citrix plugin "
arch=('x86_64')
license=('custom')
url="https://support.zoom.us/hc/en-us/articles/4415057249549-VDI-releases-and-downloads"
depends=('icaclient')
optdepends=()
replaces=('zoomcitrixplugin')
install=$pkgname.install

source=("https://zoom.us/download/vdi/${pkgver}.${_subver}/zoomvdi-universal-plugin-centos_${pkgver}.rpm")

sha512sums=('26e47efc316c349ca4b0f9dc06e0a9e61816bb38834333ac01662699062ab8ebdea8168e76986e5c8940bd882c675af1d4a03f2e3a8ac57b46cd7126c92b89c1')

package() {
    find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

