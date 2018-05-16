# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=0.11.2
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose."
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
depends=('')
makedepends=('')
options=('!emptydirs')
source=("https://github.com/errata-ai/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz")

md5sums=('76184148555b8f1f2422242fb995e962')
sha256sums=('a69f94c8a61d2837b3460eac608077efcb991f0304862134dd8276c6016cecc4')

package() {
    # cd "${srcdir}/build"
    msg2 'Installing...'
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
