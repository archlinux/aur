# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=firewarden
pkgver=1.0.1
pkgrel=1
pkgdesc="Open a file via the specified application within a private Firejail sandbox."
arch=("any")
depends=("firejail>=0.9.46")
license=("GPL2")
url="https://github.com/pigmonkey/firewarden"
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=("7fe4362ac8067c40c1c8d669793bcf2c")

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 firewarden "${pkgdir}/usr/bin/firewarden"
}
