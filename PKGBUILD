# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=3.4.0
pkgrel=1
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=3.4.0')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=()
provides=('phalcon-devtools')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/v${pkgver}.tar.gz")
sha256sums=('ca317271a8020c8c3ad4f1dbe3409250c0348e168ca089df55a5dc59a0289a3a')

package() {
  tar -xvzf ${srcdir}/v${pkgver}.tar.gz
  	
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-${pkgver} $pkgdir/opt/${pkgname}
}
