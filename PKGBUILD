# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="talm-bin"
pkgver=0.16.1
pkgrel="2"
pkgdesc="Manage Talos Linux the GitOps Way!"
arch=(x86_64)
license=('MPL-2.0')
source=("${pkgname}-${pkgver}.bin::https://github.com/aenix-io/talm/releases/download/v${pkgver}/talm-linux-amd64.tar.gz");
depends=()
provides=('talm')
sha256sums=('82bd986eacf4d090fa59f96ad558c1e4fdfd3a200d5a9f272d9e231339c7d76b')

package() {
	ls
	install -Dm0755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/talm"
}
