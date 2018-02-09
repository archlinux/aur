# Maintainer: Thanh Ha <zxiiro@linux.com>

pkgname=opendaylight
pkgver=0.7.1
pkgrel=1
pkgdesc="OpenDaylight is leading the transformation to Open SDN."
arch=('x86_64')
url="https://www.opendaylight.org/"
license=('EPL')
depends=('jre8-openjdk')
makedepends=()
provides=()
conflicts=()
options=()
install=${pkgname}.install
source=(https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/karaf/${pkgver//_/-}/karaf-${pkgver//_/-}.tar.gz)
sha256sums=('301da64f8abaeaa887f778400eebc8e1e21855187a83658668484c84d15b2412')

package() {
  mkdir -p "$pkgdir"/opt
  tar zxvf karaf-${pkgver//_/-}.tar.gz -C "$pkgdir"/opt/
  mv "$pkgdir"/opt/karaf-${pkgver//_/-} "$pkgdir"/opt/opendaylight
}

# vim: set ts=4 sw=4 et:
