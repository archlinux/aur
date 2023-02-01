# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems."
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=()
makedepends=('bash')
source=("$url/releases/download/cvc5-$pkgver/cvc5-Linux")
sha256sums=('73b2b061832107899d25158dd756cbdf9662c987c132037c4dca5293b8d1bfd3')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	mkdir -p $pkgdir/usr/bin
	cp cvc5-Linux $pkgdir/usr/bin/cvc5
	chmod +x $pkgdir/usr/bin/cvc5
}
