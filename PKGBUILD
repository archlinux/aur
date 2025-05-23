# Maintainer: Charles Dong <chardon_cs@proton.me>

_pkgname=qdrant
pkgname=${_pkgname}-bin
pkgver=1.14.1
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications - Binary"
arch=('x86_64')
url="https://qdrant.tech/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=()
provides=('qdrant')
conflicts=('qdrant')
source=(
  "https://github.com/qdrant/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-unknown-linux-gnu.tar.gz"
)
sha256sums=('7d43068cce7477061a7bd91fd5e5e139e35cfacb09d0dcdc4f4a33ace7d782d8')

package() {
  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
