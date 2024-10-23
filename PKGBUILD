# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.45.1
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/main/govc"
license=('Apache-2.0')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('e54eb1a20a387fa4900ce2b26d19c81bb82215199e30720f48a5265d95458f45')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
