# Maintainer: Michael Duell <michael.duell@rub.de> PGP-Fingerprint: FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77
pkgname=rot13
pkgver=2
pkgrel=5
pkgdesc="Converts text with ROT13 from STDIN to STDOUT or text given as arguments."
arch=('i686' 'x86_64')
license=('WTFPL')
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
sha384sums=('9fd1dc60052d20e3c0675cedb2865e6cd5b7c4f1a9ceef724f2bbcd518ae25121731af9b1a47cd9ba74f2fc7ea9c37b5')
