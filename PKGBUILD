# Maintainer: André Missaglia <andre.missaglia@gmail.com>
pkgname=kcompose
pkgver=0.2.0
pkgrel=1
pkgdesc="Utility tool for managing kafka"
arch=('any')
url="https://github.com/andremissaglia/kcompose"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andremissaglia/kcompose/archive/$pkgver.tar.gz")
md5sums=('f1c22e863550bf01254d1f4114b7d274')

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ./install.sh
}
