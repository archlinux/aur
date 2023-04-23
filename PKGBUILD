# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.0.5
pkgrel=2
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems."
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=()
makedepends=('bash')
source=("$pkgname-$pkgver::$url/releases/download/cvc5-$pkgver/cvc5-Linux")
sha256sums=('57fa94b740e0827f655a731b97dae84fedf86e65fa897c3a56a01a83d283d15e')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $pkgname-$pkgver $pkgdir/usr/bin/cvc5
	chmod +x $pkgdir/usr/bin/cvc5
}
