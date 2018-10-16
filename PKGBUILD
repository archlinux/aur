# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=1.0.2
pkgrel=2
pkgdesc="A customizable, syntax-aware linter for prose."
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
options=('!emptydirs')
source=("https://github.com/errata-ai/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz")

md5sums=('b79aaf021a4785d8f229a473b88a3d43')
sha256sums=('a701d4e8fee80fcccdd1e7c9351178ecfe56e37449cf10431a91c87bdaa60aca')

package() {
    # cd "${srcdir}/build"
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
