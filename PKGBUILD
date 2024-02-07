# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>

pkgname=icingaweb2-module-incubator
pkgver=0.21.0
pkgrel=1
pkgdesc="Bleeding edge libraries useful for Icinga Web 2 modules"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="https://github.com/Icinga/icingaweb2-module-incubator"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('788b49b38fcb9541b36eec7308705e248e1009006e77e457cda7c4f92e348634')

prepare() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/incubator"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"

  cp -r * "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"
}
