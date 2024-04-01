pkgname=anti-spam-matrix-bin
_pkgname=anti-spam-matrix
pkgver=0.1.4
pkgrel=1
pkgdesc="anti-spammer bot for matrix"
arch=("x86_64")
url="https://github.com/poly000/${_pkgname}"
provides=(${_pkgname})
license=("MIT")
depends=(
    "openssl" "glibc"
)
makedepends=()
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/poly000/${_pkgname}/releases/download/v${pkgver}/x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('c634a5793272fb3936f4d5ddc99d3685e56f1f72977b6e02a2f92038edd9dcf7')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
