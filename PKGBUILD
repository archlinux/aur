# Maintainer: Ludovic Fauvet <etix@l0cal.com>

pkgname=wombat-bin
_pkgname=wombat
pkgver=0.3.3
pkgrel=1
pkgdesc="A graphical gRPC client written in Go"
arch=('x86_64')
url="https://github.com/rogchap/wombat"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/rogchap/wombat/releases/download/v${pkgver}/Wombat_v${pkgver}_Linux_x86_64.tar.gz")
depends=()
provides=("${_pkgname}")
sha256sums_x86_64=('e81829b18b9b20e3e43a671ea9c89afaa0dcabc509b4e5a3dedc80065b076e6f')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
