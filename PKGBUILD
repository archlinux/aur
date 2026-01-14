# Contributor: Charles Dong <chardon_cs@proton.me>
# Contributor: tee < teeaur at duck dot com >

_pkgname=qdrant
pkgname=${_pkgname}-bin
pkgver=1.16.3
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications - Binary"
arch=('x86_64')
url="https://qdrant.tech"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=()
provides=('qdrant')
conflicts=('qdrant')
source=(
  "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::https://github.com/qdrant/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-unknown-linux-gnu.tar.gz"
)
sha256sums=('62e42e3e0fffd609365363be85b63ec27b215b8e7ac9929cf5736c49af0416ec')

package() {
  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
