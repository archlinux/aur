# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=()
makedepends=('bash')
source=("$pkgname-$pkgver::$url/releases/download/cvc5-$pkgver/cvc5-Linux")
sha256sums=('2fb4e27aecf6e24c3c246ef90aa6a492ed793a6fe5a38ac2e51f231101bc7ff5')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $pkgname-$pkgver $pkgdir/usr/bin/cvc5
	chmod +x $pkgdir/usr/bin/cvc5
}
