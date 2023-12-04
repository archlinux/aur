# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=2.0
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sof)
conflicts=()
source=("${url}/releases/download/v${pkgver}/sizeof-v${pkgver}-linux-amd64")
sha256sums=("2b8a7c32c74be3972db59f193b2ca7b0541146f2c29b2f4c6e186438bce8654c")

package() {
		install -Dm775 \
				sizeof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
}
