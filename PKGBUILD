# Maintainer: Jagapathi Gondi <gondijagapathi at gmail dot com>
# Contributor: Raryel C. Souza <raryel.csouza at protonmail dot com>
pkgname=zoom-citrix-plugin
pkgver=6.5.11
_subver=26770
pkgrel=1
pkgdesc="Zoom VDI Citrix plugin "
arch=('x86_64')
license=('custom')
url="https://support.zoom.us/hc/en-us/articles/4415057249549-VDI-releases-and-downloads"
depends=('icaclient')
optdepends=()
replaces=('zoomcitrixplugin')
install=$pkgname.install

source=("https://zoom.us/download/vdi/6.5.11.26770/zoomvdi-universal-plugin-centos_6.5.11.rpm")

sha512sums=('cb56d4e865259a1b6f9d7ef6372128f1ea72f1c77375472952ebe164aaa860528f2832967bbdb550617b520a91843ea3d61413d8852be2355fa189b77fedb60b')

package() {
    find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

