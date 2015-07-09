# Mantainer: spelufo <santiagopelufo@gmail.com>
# Contributor: Snowball <excitablesnowball@gmail.com>
pkgname=scmutils
pkgver=20140302
pkgrel=2
pkgdesc="Scheme library for the book Structure and Interpretation of Classical Mechanics."
arch=('i686' 'x86_64')
url="http://mitpress.mit.edu/sicm/"
license=('GPL')
depends=('mit-scheme')
makedepends=()
optdepends=()
conflicts=()
if [[ $CARCH == i868 ]]; then
	_arch=ix86
	md5sums=('2f134cab17692c0aa3f19b470deb7bc6')
else
	_arch=x86-64
	md5sums=('52e7487af7bcbba6c29f86764befe4dd')
fi
source=(http://groups.csail.mit.edu/mac/users/gjs/6946/scmutils-tarballs/$pkgname-$pkgver-$_arch-gnu-linux.tar.gz)

package() {
	mkdir -p "$pkgdir/usr/lib/mit-scheme-$_arch/"
	cp -R "$srcdir/scmutils/mit-scheme/lib/scmutils" "$pkgdir/usr/lib/mit-scheme-$_arch/"
	cp -R "$srcdir/scmutils/mit-scheme/lib/edwin-mechanics.com" "$pkgdir/usr/lib/mit-scheme-$_arch/"
}
