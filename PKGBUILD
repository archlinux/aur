# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=1.0.6
pkgrel=2
pkgdesc="A customizable, syntax-aware linter for prose."
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
options=('!emptydirs')
source=("https://github.com/errata-ai/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz")

md5sums=('00ef775dee8d005bd25dbbea2d779edb')
sha256sums=('13911520560bca05ba9ba42b5912c9f6317e2e4446d463205abf39701a0b6617')

package() {
    # cd "${srcdir}/build"
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
