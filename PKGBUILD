# Maintainer: Salama Ashoush <salama@kadena.io>

pkgname=pact
pkgver=4.9.0
pkgrel=1
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url=https://kadena.io/build/
license=('BSD 3-Clause')
depends=('gmp' 'z3' 'ncurses5-compat-libs')
source=(https://github.com/kadena-io/pact/releases/download/v${pkgver}/pact-${pkgver}-linux-22.04.zip)
md5sums=('472c4b7d183ea4ec56c6e83b8a49fc15')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
