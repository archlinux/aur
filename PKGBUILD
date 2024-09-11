# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.43.0
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/main/govc"
license=('Apache-2.0')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('710c0a1a0b232f9482d3bea986d7d9c3f954d2e63c2094629c2b69e2fe1943b0')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
