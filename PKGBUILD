# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgname=stanmath
pkgver=4.8.1
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD-3-Clause')
arch=('any')
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('78e115c89c298fb9e6fa5941b7e39c84cfea0a8f491a0dc556ab5746d5699136')

package() {
  cd math-${pkgver/_/-}
  install -d "$pkgdir"/usr/include
  cp -r stan "$pkgdir"/usr/include
}
