# Maintainer: Michael Duell <michael.duell@rub.de> PGP-Fingerprint: FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77
pkgname=rot13
pkgver=1
pkgrel=3
pkgdesc="Converts text with ROT13 from STDIN to STDOUT or text given as arguments."
arch=('i686' 'x86_64')
license=('WTFPL')
url=("https://gist.github.com/akurei/197af7e9934eb8a100be")
source=('https://gist.githubusercontent.com/akurei/197af7e9934eb8a100be/raw/bc33e2372b177162c311d4eaabe55a4cfe79e53b/rot13.c')

build() {
	cd "$srcdir/"
	gcc -std=c99 -O2 -o rot13 rot13.c
}

package() {
	cd "$srcdir/"
    install -d "${pkgdir}/usr/bin/"
    install -m755 rot13 "${pkgdir}/usr/bin/rot13"
}
sha512sums=('e93dd9b41537dee1c4bfb48d9b56a8631c4036776e688ffbc965a15728f66eb373284251adfc326313eaeacf8d1517a942af05a64ba42b82cdad6772261d167e')
