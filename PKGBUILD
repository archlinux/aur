# Maintainer: Ludovic Fauvet <etix@l0cal.com>

pkgname=wombat-bin
_pkgname=wombat
pkgver=0.2.2
pkgrel=1
pkgdesc="A graphical gRPC client written in Go"
arch=('x86_64')
url="https://github.com/rogchap/wombat"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/rogchap/wombat/releases/download/v${pkgver}/Wombat_v${pkgver}_Linux_x86_64.tar.gz")
depends=()
provides=("${_pkgname}")
sha256sums_x86_64=('6f88d49f38724899cf5aa258790482bd46972cd1c66479b047452f13ab9f7f24')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
