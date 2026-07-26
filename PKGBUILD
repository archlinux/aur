# Maintainer: Jagapathi Gondi <gondijagapathi at gmail dot com>
# Contributor: Raryel C. Souza <raryel.csouza at protonmail dot com>
pkgname=zoom-citrix-plugin
pkgver=7.0.11
_subver=27050
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

sha512sums=('e70d5fc128df625af15cfc1bacd9f6e6f6f6debf1242008955c64f8ae76d4b2cc11412b5efe68c12d791e70e3bc362073cf15c20b5e4a2c2029e5d7b838a1908')

package() {
    find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

