# Maintainer: SanskritFritz (gmail)

pkgname=ssdb
pkgver=1.9.4
pkgrel=1
pkgdesc="A fast NoSQL database, an alternative to Redis."
arch=('x86_64')
url="http://ssdb.io/"
license=('BSD')
depends=()
source=("https://github.com/ideawu/ssdb/archive/$pkgver.tar.gz")
md5sums=('0a3349bc5f58037fc4a9a71bae3fce3d')

build() {
	cd "ssdb-$pkgver"
	make
}

package() {
	cd "ssdb-$pkgver"
	make install PREFIX="$pkgdir/usr/share/ssdb"
} 
