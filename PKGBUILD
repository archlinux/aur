# Maintainer: Thanh Ha <zxiiro@linux.com>

pkgname=opendaylight
_PkgName=OpenDaylight
pkgver=0.5.1_Boron_SR1
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
sha256sums=('c4ed8cf493e0b24d1ff67644adb65a4bf436490ff55787d6ec4a72b9e22c72bd')

package() {
  mkdir -p "$pkgdir"/opt
  tar zxvf distribution-karaf-${pkgver//_/-}.tar.gz -C "$pkgdir"/opt/
  mv "$pkgdir"/opt/distribution-karaf-${pkgver//_/-} "$pkgdir"/opt/opendaylight
}

