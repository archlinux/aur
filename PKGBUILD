# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgname=stanmath
pkgver=4.3.2
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD')
arch=('any')
url="https://github.com/stan-dev/math"
depends=('boost' 'sundials' 'tbb' 'eigen')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9efbb1a9c40b5484b971a278bfef1b9fba3f0390af8d0d81928a820bb91a6781')

package() {
  cd math-${pkgver}
  install -d "$pkgdir"/include
  cp -r stan "$pkgdir"/include
}
