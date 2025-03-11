# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="talm-bin"
pkgver=0.8.3
pkgrel="2"
pkgdesc="Manage Talos Linux the GitOps Way!"
arch=(x86_64)
license=('MPL-2.0')
source=("${pkgname}-${pkgver}.bin::https://github.com/aenix-io/talm/releases/download/v${pkgver}/talm-linux-amd64");
depends=()
provides=('talm')
sha256sums=('79f142ce03085ac834d92c255b7b38c7f9c3844099c205e57cd88aa28ef6ed6c')

package() {
	install -Dm0755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/talm"
}
