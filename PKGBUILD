# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.0.2
pkgrel=3
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems."
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=()
source=("$url/releases/download/cvc5-$pkgver/cvc5-Linux")
sha256sums=('f8734f8db1032f706a01bd5ee40e4e54fd073bc360c823af827bccc98fc32d23')

package() {
	mkdir -p $pkgdir/usr/bin
	cp cvc5-Linux $pkgdir/usr/bin/cvc5
	chmod +x $pkgdir/usr/bin/cvc5
}
