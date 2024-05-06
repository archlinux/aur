# Maintainer: David Wang <david.wang [at] kcl [dot] ac [dot] uk>
pkgname=isabelle-linter
pkgver=2023
pkgrel=1.0
pkgdesc="A linter component for Isabelle"
arch=('i686' 'x86_64')
url="https://github.com/isabelle-prover/isabelle-linter/"
license=('MIT')
groups=('science')
depends=("isabelle=${pkgver//_/-}")
source=(https://github.com/isabelle-prover/isabelle-linter/archive/refs/tags/Isabelle${pkgver//_/-}-v${pkgrel//_/-}.0.tar.gz)
            

package() {
	cd "$srcdir/isabelle-linter-Isabelle${pkgver//_/-}-v${pkgrel//_/-}.0/"
	mkdir -p "$pkgdir/opt/isabelle-linter/"
	cp -r * "$pkgdir/opt/isabelle-linter/"
}

sha256sums=('84bef37fdc4ac9c471b0b9abb4c4cbafdb6b709eb7a541793f97bfbefba53c35')

install=isabelle-linter.install