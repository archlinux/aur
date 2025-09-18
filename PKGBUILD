# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="talm-bin"
pkgver=0.16.2
pkgrel="2"
pkgdesc="Manage Talos Linux the GitOps Way!"
arch=(x86_64)
license=('MPL-2.0')
source=("${pkgname}-${pkgver}.bin::https://github.com/aenix-io/talm/releases/download/v${pkgver}/talm-linux-amd64.tar.gz");
depends=()
provides=('talm')
sha256sums=('d14b90cbb1b34809a4c5da096a987894fbeb5cef3a7f91e2009163cc47894754')

package() {
	ls
	install -Dm0755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/talm"
}
