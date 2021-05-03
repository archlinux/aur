# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.0.5'
pkgrel='1'
pkgdesc='RSS-based YouTube subscription download tool'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'youtube-dl>=2020.11.21.1')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e0228e49809e4b4887b79774b5860cdd2e4d2281c1c118918ee1d3bd262cc98e')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
