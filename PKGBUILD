# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="talm-bin"
pkgver=0.12.0
pkgrel="2"
pkgdesc="Manage Talos Linux the GitOps Way!"
arch=(x86_64)
license=('MPL-2.0')
source=("${pkgname}-${pkgver}.bin::https://github.com/aenix-io/talm/releases/download/v${pkgver}/talm-linux-amd64");
depends=()
provides=('talm')
sha256sums=('db9d92c17ecacac47cd155cabfe1ec67621e4c19494b605c5596817ed7365d01')

package() {
	install -Dm0755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/talm"
}
