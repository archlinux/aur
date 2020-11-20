# Maintainer: Ludovic Fauvet <etix@l0cal.com>

pkgname=wombat-bin
_pkgname=wombat
pkgver=0.3.1
pkgrel=1
pkgdesc="A graphical gRPC client written in Go"
arch=('x86_64')
url="https://github.com/rogchap/wombat"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/rogchap/wombat/releases/download/v${pkgver}/Wombat_v${pkgver}_Linux_x86_64.tar.gz")
depends=()
provides=("${_pkgname}")
sha256sums_x86_64=('84ba5532808be1ae0c1f5a051b3adbb5e8f798e68ec1551c417d7bace4848317')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
