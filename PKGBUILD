# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.0.2'
pkgrel='1'
pkgdesc='A simple bash script that will help you manage your AUR packages'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('git' 'pacman-contrib' 'perl')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('69feb179b47d415d76402468c6414f4a2d02a79086493e908e53a006d313e761460014d791400883f9aae1e138fe3facb8e270d522cac2ae349f90b810c70b0d')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
