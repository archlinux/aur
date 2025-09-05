# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>

pkgname=icingaweb2-module-incubator
pkgver=0.23.0
pkgrel=1
pkgdesc="Bleeding edge libraries useful for Icinga Web 2 modules"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="https://github.com/Icinga/icingaweb2-module-incubator"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3180e0e6af0d32d5c1478f36a011afcdc1d1540fd2c784fed1c4584f4058f603')

prepare() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/incubator"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"

  cp -r * "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"
}
