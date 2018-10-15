# Maintainer: André Missaglia <andre.missaglia@gmail.com>
pkgname=kcompose
pkgver=0.1.1
pkgrel=1
pkgdesc="Utility tool for managing kafka"
arch=('any')
url="https://github.com/andremissaglia/kcompose"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andremissaglia/kcompose/archive/$pkgver.tar.gz")
md5sums=('4dbf23770c27e4b553d873bffae99a2a')

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ./install.sh
}
