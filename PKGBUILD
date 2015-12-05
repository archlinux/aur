# Maintainer: Thanh Ha <zxiiro@linux.com>

pkgname=opendaylight
_PkgName=OpenDaylight
pkgver=0.3.3_Lithium_SR3
pkgrel=1
pkgdesc="OpenDaylight is leading the transformation to Open SDN."
arch=('i686' 'x86_64')
url="https://www.opendaylight.org/"
license=('EPL')
depends=('java-runtime')
makedepends=()
provides=()
conflicts=()
options=()
install=${pkgname}.install
source=(https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/distribution-karaf/${pkgver//_/-}/distribution-karaf-${pkgver//_/-}.tar.gz)
sha256sums=('01a6b6a49a13378f0ad04a259be7b5b176d287771014e2f5e5fb394365f00414')

package() {
  mkdir -p "$pkgdir"/opt
  tar zxvf distribution-karaf-${pkgver//_/-}.tar.gz -C "$pkgdir"/opt/
  mv "$pkgdir"/opt/distribution-karaf-${pkgver//_/-} "$pkgdir"/opt/opendaylight
}

