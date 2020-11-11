# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='0.2.2'
pkgrel='1'
pkgdesc='RSS-based YouTube subscription download tool'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'youtube-dl>=2020.09.14')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4db527abb3fe2dca8dce4cf9d951ba9acf20e5c06dcb5d40f330fd920adecb85')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
