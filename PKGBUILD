# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.36.2
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/master/govc"
license=('Apache')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('47130749a94755f53cf8d39c6e22e1fcf045fdca9c2f480c19a6a51cd67991c3')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
