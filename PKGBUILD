# Maintainer: Jagapathi Gondi <gondijagapathi at gmail dot com>
# Contributor: Raryel C. Souza <raryel.csouza at protonmail dot com>
pkgname=zoom-citrix-plugin
pkgver=7.0.13
_subver=27170
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

sha512sums=('d8b3c0f5fd47d068eb412f4a24f655a0c103d96a76e4fd777b8f917256aaf02a5a9b83735f2a2ba1c923461632c88cae9db4cd020e7f131e79eff5de8d1c1e06')

package() {
    find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

