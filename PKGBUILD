# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgname=stanmath
pkgver=4.9.0
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD-3-Clause')
arch=('any')
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('876881b71dee6fec32f2b4aa52692994cccd2a19c6de1b986d7fc457155f219c')

package() {
  cd math-${pkgver/_/-}
  install -d "$pkgdir"/usr/include
  cp -r stan "$pkgdir"/usr/include
}
