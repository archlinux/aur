# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=3.0.1
pkgrel=1
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=3.0.1')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=()
provides=('php-phalcon')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/v${pkgver}.tar.gz")
sha256sums=('0e2dc6ea411c26dd49d21639468a6bed19fb77e6f683fef2c3a7a0de0353e27f')

package() {
  tar -xvzf ${srcdir}/v${pkgver}.tar.gz
  	
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-${pkgver} $pkgdir/opt/${pkgname}
}
