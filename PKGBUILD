# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgname=stanmath
pkgver=4.6.2
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD')
arch=('any')
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('30df8657e02ddc77b6c96ac32f8d6f099a61064a113373cd3a11ffd736372ba1')

package() {
  cd math-${pkgver/_/-}
  install -d "$pkgdir"/usr/include
  cp -r stan "$pkgdir"/usr/include
}
