pkgname=wastebin-moku-bin
_pkgname=wastebin
pkgver=3.1.0
pkgrel=2
pkgdesc='wastebin is a minimal pastebin. (perf patch)'
arch=("x86_64")
url="https://github.com/mokurin000/${_pkgname}"
provides=(${_pkgname}-moku)
conflicts=(${_pkgname})
license=("MIT")
depends=()
makedepends=()
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/mokurin000/${_pkgname}/releases/download/${pkgver}/x86_64-unknown-linux-musl.tar.gz"
)
sha256sums=('cb3ca13bf92d26ff93f350647d0054c890569e53d295f0b6a545374c5b3de5de')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 ${_pkgname}-ctl "${pkgdir}/usr/bin/${_pkgname}-ctl"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
