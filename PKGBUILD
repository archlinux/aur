# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.30.5
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/master/govc"
license=('Apache')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('ca6e96edffc2ab7658656b117950df1ee976cc91ad7d9112b14a3c1d2eddbaaf')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
