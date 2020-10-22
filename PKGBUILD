pkgname=stanmath
pkgver=3.3.0
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD')
arch=('any')
url="https://mc-stan.org/"
depends=('boost' 'sundials' 'tbb' 'eigen')
source=("https://github.com/stan-dev/math/archive/v${pkgver}.tar.gz")
sha256sums=('fb96629fd3e5e06f0ad4c03a774e54b045cc1dcfde5ff65b6f78f0f05772770a')

package() {
  cd math-${pkgver}
  install -d "$pkgdir"/include
  cp -r stan "$pkgdir"/include
}
