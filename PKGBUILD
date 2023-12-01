# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sizeof-go-bin
pkgver=2.0
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sizeof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sizeof)
conflicts=()
source=("https://codeberg.org/balaraz/sizeof/releases/download/v${pkgver}/sizeof-v${pkgver}-linux-amd64")
sha256sums=("2b8a7c32c74be3972db59f193b2ca7b0541146f2c29b2f4c6e186438bce8654c")

package() {
		mv sizeof-v$pkgver-linux-amd64 sizeof
		install -Dm775 sizeof -t ${pkgdir}/usr/bin/
}
