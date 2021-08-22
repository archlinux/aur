# Maintainer: Jonathan Wright <jon@than.io>

pkgname=waypoint-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Consistent developer workflow tool"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("waypoint=${pkgver}")

source_x86_64=("waypoint-${pkgver}.zip::https://releases.hashicorp.com/waypoint/${pkgver}/waypoint_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('da710d48b29b033ba7d26268eac3f604bd88284ffe0355e9c3fb88ca59562124')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/waypoint" "$pkgdir/usr/bin/waypoint"
}
