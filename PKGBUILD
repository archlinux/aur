# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=firewarden
pkgver=1.1.4
pkgrel=1
pkgdesc="Open a file via the specified application within a private Firejail sandbox."
arch=("any")
depends=("firejail>=0.9.56")
license=("GPL2")
url="https://github.com/pigmonkey/firewarden"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('f139dd4e3b6be4dfecaf507e006e957833ed46f8b7a046680493502388b63447')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 firewarden "${pkgdir}/usr/bin/firewarden"
}
