# Maintainer: Jonathan Wright <jon@than.io>

pkgname=waypoint-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Consistent developer workflow tool"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("waypoint=${pkgver}")

source_x86_64=("waypoint-${pkgver}.zip::https://releases.hashicorp.com/waypoint/${pkgver}/waypoint_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('3fba8cd3326584333b810be0b41eb9bb01833350c4e513417a3b22e5fd0a393a')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/waypoint" "$pkgdir/usr/bin/waypoint"
}
