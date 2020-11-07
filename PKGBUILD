# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='kahlo'
pkgver='0.2.0'
pkgrel='1'
pkgdesc='RSS-based YouTube subscription download tool'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'youtube-dl>=2020.09.14')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8db8dd260d32a392d2029c9b455c1db0cc06e9ed3b8c6841527423f3f9d62a2b')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
