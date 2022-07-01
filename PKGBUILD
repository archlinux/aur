# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgname=stanmath
pkgver=4.4.0
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD')
arch=('any')
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50c1530910427cadc8059300344424700a9b0178d0fe773781150c0e200e5fe9')

package() {
  cd math-${pkgver}
  install -d "$pkgdir"/usr/include
  cp -r stan "$pkgdir"/usr/include
}
