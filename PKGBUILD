# Maintainer: Jonathan Wright <jon@than.io>

pkgname=waypoint-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Consistent developer workflow tool"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("waypoint=${pkgver}")

source_x86_64=("waypoint-${pkgver}.zip::https://releases.hashicorp.com/waypoint/${pkgver}/waypoint_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('ec2ef7e11f3e1b9ba4a71cc23478f2d60445baddab92d05782d03a6a5e9a824e')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/waypoint" "$pkgdir/usr/bin/waypoint"
}
