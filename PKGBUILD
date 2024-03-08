# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.36.0
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/master/govc"
license=('Apache')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('9ee0e1cc62a7280602975d6b0aadb2d961de8489724e1f4842e53b81ac160ba6')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
