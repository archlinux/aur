pkgname=wastebin-bin
_pkgname=wastebin
pkgver=3.0.0
pkgrel=2
pkgdesc='wastebin is a minimal pastebin.'
arch=("x86_64")
url="https://github.com/matze/${_pkgname}"
provides=(${_pkgname})
license=("MIT")
depends=()
makedepends=()
source=(
    "$pkgname-$pkgver.zip::https://github.com/matze/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_x86_64-unknown-linux-musl.zip"
)
sha256sums=('73c8e11e114b2d8c732033bf8dff8b94f26ae6d8bc0acb0c0c3305cf0a9c61bc')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
