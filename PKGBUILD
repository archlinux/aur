# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=2.0
pkgrel=4
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(go)
provides=(sof)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("f5437bc982790f43203623b1342a18d771e16642ad20f5770cdefead74fda8ab")

package() {
		go build \
				--ldflags="-s -w" \
				-o ${pkgdir}/usr/bin/${pkgname} \
				sizeof/sizeof.go
}
