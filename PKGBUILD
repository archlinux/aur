# Maintainer: Charles Dong <chardon_cs@proton.me>

_pkgname=qdrant
pkgname=${_pkgname}-bin
pkgver=1.14.0
pkgrel=2
pkgdesc="Vector Database for the next generation of AI applications - Binary"
arch=('x86_64' 'aarch64')
url="https://qdrant.tech/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=()
provides=('qdrant')
conflicts=('qdrant')
source=(
  "https://github.com/qdrant/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-unknown-linux-gnu.tar.gz"
)
sha256sums=('28e344971b38fc4682b8a7bf4952be6bb46f6f6604b0630a79db897164d2cc12')

package() {
  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
