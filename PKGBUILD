# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=()
makedepends=('bash')
source=("$pkgname-$pkgver::$url/releases/download/cvc5-$pkgver/cvc5-Linux")
sha256sums=('fe74a3ae70462d715871918c6277c88b10a1335ab55ecfb53a10ff5aa501d20a')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $pkgname-$pkgver $pkgdir/usr/bin/cvc5
	chmod +x $pkgdir/usr/bin/cvc5
}
