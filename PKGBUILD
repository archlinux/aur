# Maintainer: Jonathan Wright <jon@than.io>

pkgname=waypoint-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Consistent developer workflow tool"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("waypoint=${pkgver}")

source_x86_64=("waypoint-${pkgver}.zip::https://releases.hashicorp.com/waypoint/${pkgver}/waypoint_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('6414d51bf525d4f841a0aa895f322f3ef940e874e038538023c4fabb8173ce15')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/waypoint" "$pkgdir/usr/bin/waypoint"
}
