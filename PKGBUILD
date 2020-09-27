# Maintainer: SanskritFritz (gmail)

pkgname=ssdb
pkgver=1.9.9
pkgrel=1
pkgdesc="A fast NoSQL database, an alternative to Redis."
arch=('x86_64')
url="http://ssdb.io/"
license=('BSD')
depends=()
source=("https://github.com/ideawu/ssdb/archive/$pkgver.tar.gz")
md5sums=('3502031320b804cbc2325dc84fe4e09c')

build() {
	cd "ssdb-$pkgver"
	make
}

package() {
	cd "ssdb-$pkgver"
	make install PREFIX="$pkgdir/usr/share/ssdb"
} 
