# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems."
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=()
source=("$url/releases/download/cvc5-$pkgver/cvc5-Linux")
sha256sums=('39b8da16f988abb35db220fb6c95fba1bb06633cb6e4e4cec2f7cf4010d1c8d9')

package() {
	mkdir -p $pkgdir/usr/bin
	cp cvc5-Linux $pkgdir/usr/bin/cvc5
	chmod +x $pkgdir/usr/bin/cvc5
}
