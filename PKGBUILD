# Maintainer: Colin Reeder <vpzomtrrfrt@gmail.com>
pkgname=tpac
pkgver=1.0rc1
_pkgver=1.0-rc1
pkgrel=1
pkgdesc="trizen wrapper to mimic yaourt's search feature"
arch=(any)

source=("https://github.com/romano21A/trizen-pac/archive/v${_pkgver}.tar.gz")
sha256sums=("2e1e47b9ee5c795daee54426af282e58cf21d2ba733ebb778cd3544f8169f1e3")

package() {
	install -dm 755 "$pkgdir"/usr/bin/
	install -m 755 "trizen-pac-${_pkgver}/tpac" "$pkgdir"/usr/bin
}
