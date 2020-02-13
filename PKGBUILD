# Maintainer: Colin Woodbury <colin@kadena.io>

pkgname=pact
pkgver=3.4.0
pkgrel=1
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url='https://pactlang.org/'
license=('BSD 3-Clause')
depends=('gmp' 'z3' 'ncurses5-compat-libs')
source=(https://github.com/kadena-io/pact/releases/download/v${pkgver}/pact-${pkgver}-linux.zip)
md5sums=('822d79ac6b3a4be6ff03f518d81963cd')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
