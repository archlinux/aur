# Maintainer: Charles Dong <chardon_cs@proton.me>

_pkgname=qdrant
pkgname=${_pkgname}-bin
pkgver=1.15.1
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
  "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::https://github.com/qdrant/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-unknown-linux-gnu.tar.gz"
)
sha256sums=('edf1fed439685da4314cea8d50e26b12086d2a2d630627c046a80bd43c46eb63')

package() {
  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
