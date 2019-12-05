# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=firewarden
pkgver=1.1.1
pkgrel=1
pkgdesc="Open a file via the specified application within a private Firejail sandbox."
arch=("any")
depends=("firejail>=0.9.56")
license=("GPL2")
url="https://github.com/pigmonkey/firewarden"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('a7f0f7deef5206fc0bd804cce7a29198')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 firewarden "${pkgdir}/usr/bin/firewarden"
}
