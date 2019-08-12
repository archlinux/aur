# Maintainer: Colin Woodbury <colin@kadena.io>

pkgname=pact
pkgver=3.1.0
pkgrel=1
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url='https://pactlang.org/'
license=('BSD 3-Clause')
depends=('gmp' 'z3' 'ncurses5-compat-libs')
source=(https://github.com/kadena-io/pact/releases/download/v${pkgver}/pact-${pkgver}-linux.zip)
md5sums=('c6e7482b8ad5f71524d04d5a4cab5612')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
