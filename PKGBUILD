# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.48.1
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/main/govc"
license=('Apache-2.0')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('e013d1da596368efe55d7d612e83f6e685c8400699ce5475808301ac1ac42f19')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
