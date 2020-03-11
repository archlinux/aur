# Maintainer: Colin Woodbury <colin@kadena.io>

pkgname=pact
pkgver=3.5.0
pkgrel=1
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url="https://pactlang.org/"
license=('BSD 3-Clause')
depends=('gmp' 'z3' 'ncurses5-compat-libs')
source=(https://github.com/kadena-io/pact/releases/download/v${pkgver}/pact-${pkgver}-linux.zip)
md5sums=('d1d420e338f6c0dca14609700514ef42')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
