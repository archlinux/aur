# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='kahlo'
pkgver='0.2.1'
pkgrel='1'
pkgdesc='RSS-based YouTube subscription download tool'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'youtube-dl>=2020.09.14')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ebadbf367ad4c085086948834229e5f07f9a3fca547d38bab5d2b31da2db5280')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
