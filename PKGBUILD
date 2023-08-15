# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.0.6
pkgrel=2
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=()
makedepends=('bash')
source=("$pkgname-$pkgver::$url/releases/download/cvc5-$pkgver/cvc5-Linux")
sha256sums=('40ea5db4710335ff2e6e5c38202c675b224e7f6aa336419a04ac2f85054a2a44')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $pkgname-$pkgver $pkgdir/usr/bin/cvc5
	chmod +x $pkgdir/usr/bin/cvc5
}
