# Maintainer: Colin Woodbury <colin@kadena.io>

pkgname=pact
pkgver=2.6.1
pkgrel=2
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url='http://kadena.io/pact'
license=('BSD 3-Clause')
depends=('gmp' 'z3')
source=(https://install.kadena.io/pact/builds/${pkgver}/ubuntu-1204/pact-${pkgver}-linux.zip)
md5sums=('6e03975b9f524527c3a320e9aa2b1d13')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
