# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>

pkgname=icingaweb2-module-incubator
pkgver=0.22.0
pkgrel=1
pkgdesc="Bleeding edge libraries useful for Icinga Web 2 modules"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="https://github.com/Icinga/icingaweb2-module-incubator"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('251ef67c005311e2ebf5463d14d07695a04625125720aed3e0dd4b5552b52093')

prepare() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/incubator"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"

  cp -r * "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"
}
