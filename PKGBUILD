# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=1.4.3
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz")

sha256sums=('71d398b7b0d360d4b803fe58ec320ac8647504f76a545d7c23a9ea5defff78c0')

package() {
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
