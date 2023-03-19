# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Michael Duell <mail@akurei.me> PGP-Fingerprint: FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77
pkgname=rot13
pkgver=3
pkgrel=3
pkgdesc="Converts text with ROT13 from STDIN to STDOUT or text given as arguments."
arch=('i686' 'x86_64')
license=('MIT')
source=('rot13.c')

build() {
	cd "$srcdir/"
	gcc -std=c99 -Wall -pedantic -O2 -o rot13 rot13.c
}

package() {
	cd "$srcdir/"
    install -d "${pkgdir}/usr/bin/"
    install -m755 rot13 "${pkgdir}/usr/bin/rot13"
}
sha384sums=('9b4fe06b2ecca3dd19ed909454f618948d917a23133856848ba0f5624b485ac3807de8d49d2a0cf4cd2c210c537ccec0')
