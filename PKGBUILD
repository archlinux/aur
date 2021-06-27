# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.0.6'
pkgrel='1'
pkgdesc='RSS-based YouTube subscription download tool'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'youtube-dl>=2020.11.21.1')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('02348240a3914613f010f2b832951401840ce2c89a16b4063292d937dbfaab2e')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
