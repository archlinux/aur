# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgname=stanmath
pkgver=4.8.0
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD-3-Clause')
arch=('any')
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('b707737c8ce6833cf2b0d279f380c0d7fd47c76288578982dafeabf583b738c1')

package() {
  cd math-${pkgver/_/-}
  install -d "$pkgdir"/usr/include
  cp -r stan "$pkgdir"/usr/include
}
