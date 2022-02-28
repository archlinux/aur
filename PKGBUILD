# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.27.4
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/master/govc"
license=('Apache')
source=(
	"https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_Linux_x86_64.tar.gz"
)
sha256sums=('529d357cc504df17199971fa0586af5e381f1c15482dc0eda60ff5c9b17d8d5e')

package() {
  cd "$srcdir"

  install -Dm755 govc "$pkgdir/usr/bin/govc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
