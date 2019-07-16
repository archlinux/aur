# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=3.4.2
pkgrel=4
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=3.4.0')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=()
provides=('phalcon-devtools')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/v${pkgver}.tar.gz")
sha256sums=('de67ec9d096d62deec8412b0d4c9f612943526870b21d6e4968cd76a99614878')

package() {
  tar -xvzf ${srcdir}/v${pkgver}.tar.gz
  	
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-${pkgver} $pkgdir/opt/${pkgname}
}
