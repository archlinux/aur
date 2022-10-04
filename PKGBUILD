# Maintainer: Jonathan Wright <jon@than.io>

pkgname=waypoint-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Consistent developer workflow tool"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("waypoint=${pkgver}")

source_x86_64=("waypoint-${pkgver}.zip::https://releases.hashicorp.com/waypoint/${pkgver}/waypoint_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('c04ff4aa2b620a6e2d5df307e95a72e85c80adb330e7852e33b6fa5f4adab143')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/waypoint" "$pkgdir/usr/bin/waypoint"
}
