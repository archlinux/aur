# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='kahlo'
pkgver='0.0.2'
pkgrel='1'
pkgdesc='RSS-based YouTube subscription download tool'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'youtube-dl>=2020.07.28')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('044d5c63cffd04674e28f389f3e5cf324d3aadfb88bcba8d1d4305342ccb9a59')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
