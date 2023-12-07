# Maintainer: Salama Ashoush <salama@kadena.io>

pkgname=pact
pkgver=4.10.0
pkgrel=1
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url=https://kadena.io/build/
license=('BSD 3-Clause')
depends=('gmp' 'z3' 'ncurses5-compat-libs')
source=(https://github.com/kadena-io/pact/releases/download/v${pkgver}/pact-${pkgver}-linux-22.04.zip)
md5sums=('be4ea601983ead2b6a8832c4a09ea2f7')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
