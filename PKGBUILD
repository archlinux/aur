# Maintainer: getzze <getzze@gmail.com>

pkgname=deluge-labelplus
pkgver=0.3.2.4
pkgrel=1
_pyver=3.7
pkgdesc="LabelPlus is a plugin for Deluge for labeling torrent, with much more functionalities that the builtin Labels."
arch=('any')
## Set to fork until included upstream
url="https://github.com/bdutro/deluge-labelplus"
#url="https://github.com/ratanakvlun/deluge-labelplus"
license=(GPL3)
depends=('deluge')
source=($url/releases/download/v$pkgver/LabelPlus-$pkgver-py${_pyver}.egg)

sha256sums=('5f9c1f9598eaca53bf512a70c0697c50af614c36cc4d27e5ab0c877e7979eebc')
noextract=(LabelPlus-$pkgver-py${_pyver}.egg)

package() {
	install -Dm644 "LabelPlus-$pkgver-py${_pyver}.egg" "${pkgdir}/usr/lib/python${_pyver}/site-packages/deluge/plugins/LabelPlus-$pkgver-py${_pyver}.egg"
}

