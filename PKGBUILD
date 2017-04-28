# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=3.1.2
pkgrel=1
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=3.1.0')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=()
provides=('php-phalcon')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/v${pkgver}.tar.gz")
sha256sums=('6caf575c5797f0dfadcb3aec648c6b7f4dde84c41145479fbc238055b3456d97')

package() {
  tar -xvzf ${srcdir}/v${pkgver}.tar.gz
  	
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-${pkgver} $pkgdir/opt/${pkgname}
}
