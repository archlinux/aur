# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=3.2.1
pkgrel=1
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=3.2.0')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=()
provides=('php-phalcon')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/v${pkgver}.tar.gz")
sha256sums=('1a236099372454c5faf73f3253e16185e3134c05e99e2cd5912ba6e46085fa5f')

package() {
  tar -xvzf ${srcdir}/v${pkgver}.tar.gz
  	
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-${pkgver} $pkgdir/opt/${pkgname}
}
