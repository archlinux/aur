# Maintainer: André Missaglia <andre.missaglia@gmail.com>
pkgname=kcompose
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility tool for managing kafka"
arch=('any')
url="https://github.com/andremissaglia/kcompose"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andremissaglia/kcompose/archive/$pkgver.tar.gz")
md5sums=('2681b6e9da94eda1ec98fdf2c646c3d2')

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ./install.sh
}
