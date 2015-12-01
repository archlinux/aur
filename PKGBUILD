# Maintainer: Thanh Ha <zxiiro@linux.com>

pkgname=opendaylight
_PkgName=OpenDaylight
pkgver=0.3.2_Lithium_SR2
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
sha256sums=('6430f977921f069e95f49f356500795fc18657b15a94e4f8893a5134f315f752')

package() {
  mkdir -p "$pkgdir"/opt
  tar zxvf distribution-karaf-${pkgver//_/-}.tar.gz -C "$pkgdir"/opt/
  mv "$pkgdir"/opt/distribution-karaf-${pkgver//_/-} "$pkgdir"/opt/opendaylight
}

