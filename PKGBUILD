# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="talm-bin"
pkgver=0.8.2
pkgrel="1"
pkgdesc="Manage Talos Linux the GitOps Way!"
arch=(x86_64)
license=('MPL-2.0')
source=(https://github.com/aenix-io/talm/releases/download/v${pkgver}/talm-linux-amd64);
depends=()
provides=('talm')
sha256sums=('250583e1d0d899897b7f276c2e3e14c9de068fc5b89ed6106bc2f7562b2283b5')

package() {
	install -Dm0755 "talm-linux-amd64" "$pkgdir/usr/bin/talm"
}
