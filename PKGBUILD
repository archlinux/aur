# Maintainer: Kaan Genç <SeriousBug at Gmail dot com>

pkgname=cheat
pkgver=1.0.3
pkgrel=1
pkgdesc="A minimal unit testing framework for the C programming language."
arch=(any)
url="https://github.com/Tuplanolla/cheat"
license=('BSD')
source=("https://github.com/Tuplanolla/cheat/archive/1.0.3.tar.gz")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 cheat.h "$pkgdir/usr/include/cheat.h"
	install -Dm644 cheats.h "$pkgdir/usr/include/cheats.h"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 cheat.7 "$pkgdir/usr/share/man/man7/cheat.7"
}
