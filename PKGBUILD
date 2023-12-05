# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=3.0
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sof)
conflicts=()
source=("${url}/releases/download/v${pkgver}/sof-v${pkgver}-linux-amd64")
sha256sums=("605f7662fefd37fa7b0e9014cda4601f8f73a95fae130c0fd44cb45f5d0945a9")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
}
