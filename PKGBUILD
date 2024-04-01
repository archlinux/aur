pkgname=anti-spam-matrix-bin
_pkgname=anti-spam-matrix
pkgver=0.1.3
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
sha256sums=('740503b2e2415b276637837212a262569c21115f43028b7de336b968af2352f0')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
