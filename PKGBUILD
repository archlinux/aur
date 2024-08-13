# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.40.0
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/main/govc"
license=('Apache-2.0')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('45ced45b634a1d1e9df4a2208d8be4d6c2f142b7fe105ef7301b5dc1a3302c52')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
