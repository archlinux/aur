# Maintainer: Ludovic Fauvet <etix@l0cal.com>

pkgname=wombat-bin
_pkgname=wombat
pkgver=0.2.0
pkgrel=2
pkgdesc="A graphical gRPC client written in Go"
arch=('x86_64')
url="https://github.com/rogchap/wombat"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/rogchap/wombat/releases/download/v${pkgver}/Wombat_v${pkgver}_Linux_x86_64.tar.gz")
depends=()
provides=("${_pkgname}")
sha256sums_x86_64=('ec756c10857ff54eb1105d03175b0bdc1bb8a2d84912b84e805117f67317c59f')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
