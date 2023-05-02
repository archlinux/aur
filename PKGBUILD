# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgname=stanmath
pkgver=4.6.1
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD')
arch=('any')
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('2df2be173e922b2794e0457f537fe0b0276a66515051cbb8c61e488cfe12f795')

package() {
  cd math-${pkgver/_/-}
  install -d "$pkgdir"/usr/include
  cp -r stan "$pkgdir"/usr/include
}
