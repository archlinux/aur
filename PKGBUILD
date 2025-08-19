# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.52.0
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/main/govc"
license=('Apache-2.0')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('cd18ceff7418189ddf96851c410713cfc38f5b79560fdea831f1bfcc74d09c3f')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
