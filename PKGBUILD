# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=firewarden
pkgver=1.1.0
pkgrel=1
pkgdesc="Open a file via the specified application within a private Firejail sandbox."
arch=("any")
depends=("firejail>=0.9.56")
license=("GPL2")
url="https://github.com/pigmonkey/firewarden"
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('e664e48a130d5cd811b1b97e0cf24e23')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 firewarden "${pkgdir}/usr/bin/firewarden"
}
