# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='A simple bash script that will help you manage your AUR packages'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('git' 'pacman-contrib' 'perl')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('500e4e32799b308a4a051778c5c96e0f7f1d583a590ccec8eeeada2d622e4e2389a89b2a1280992e8a5a6125ace75b57be15eee22a6361324754050f278c8b62')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
