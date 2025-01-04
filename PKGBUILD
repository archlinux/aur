# Maintainer: li0ard <li0ard@li0ard.rest>

pkgname=crapto1
pkgver=0.1.1
pkgrel=3
pkgdesc="Utilities extract keys from nonces collected during the authentication process"
arch=('i686' 'x86_64')
url='https://github.com/li0ard/crapto1/'
license=('GPL3')
makedepends=('git' 'automake')
source=("$pkgname::git+https://github.com/li0ard/crapto1.git")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname/mf32" "$pkgdir/usr/bin/mf32"
	install -Dm755 "$srcdir/$pkgname/mf64" "$pkgdir/usr/bin/mf64"
	install -Dm755 "$srcdir/$pkgname/n2k" "$pkgdir/usr/bin/n2k"
}