# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="talm-bin"
pkgver=0.20.0
pkgrel="2"
pkgdesc="Manage Talos Linux the GitOps Way!"
arch=(x86_64)
license=('MPL-2.0')
source=("${pkgname}-${pkgver}.bin::https://github.com/aenix-io/talm/releases/download/v${pkgver}/talm-linux-amd64.tar.gz");
depends=()
provides=('talm')
sha256sums=('f45e028fec2b08ef04c970c984fd783566f4b8a2602a22b7405336da456711b8')

package() {
	ls
	install -Dm0755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/talm"
}
