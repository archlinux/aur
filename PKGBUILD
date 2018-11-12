# Maintainer: Colin Woodbury <colin@kadena.io>

pkgname=pact
pkgver=2.5.1
pkgrel=1
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url='http://kadena.io/pact'
license=('BSD 3-Clause')
depends=('gmp' 'z3')
source=(https://kadena.io/pact/builds/${pkgver}/ubuntu-1204/pact-${pkgver}-linux.zip)
md5sums=('d747a4161b8d355ad02886e1c4f5c66b')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
