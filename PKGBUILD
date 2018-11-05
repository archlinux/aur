# Maintainer: Colin Woodbury <colin@kadena.io>

pkgname=pact
pkgver=2.5.0
pkgrel=1
pkgdesc="Interpreter for the Pact Smart Contract Language."
arch=('x86_64')
url='http://kadena.io/pact'
license=('BSD 3-Clause')
depends=('gmp' 'z3')
source=(https://kadena.io/pact/builds/${pkgver}/ubuntu-1204/pact-${pkgver}-linux.zip)
md5sums=('32dd8cf6d509bf5204e4984feb9f1613')

package() {
  install -Dm 755 ${srcdir}/pact ${pkgdir}/usr/bin/pact
}
