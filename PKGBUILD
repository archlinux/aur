# Maintainer: Isaac True <isaac@is.having.coffee>
pkgname=python2-teacup
pkgver=1.0
pkgrel=2
pkgdesc="TEACUP enables repeatable testing of different TCP algorithms over a range of emulated network path conditions."
arch=('any')
url="http://sourceforge.net/projects/teacup/"
license=('BSD')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://downloads.sourceforge.net/teacup/teacup-$pkgver.tar.gz)
sha512sums=('ddc3643f949d614febb5efa5b5c2b2f7163db172bcf974ad2931b7584487082186d4748482211127d20151629304e469f7f342449144d8882f02d730bb623edf')
package() {
      cd "${srcdir}/"
      install -d "${pkgdir}"/opt/
      mv "teacup-${pkgver}" "${pkgdir}"/opt/teacup
  }
