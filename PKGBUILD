# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=0.8.1
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose."
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/ValeLint/vale"
license=('MIT')
depends=('')
makedepends=('')
options=('!emptydirs')
source=("https://github.com/ValeLint/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz")

md5sums=('dbf8c66ede04c9309ecb476584f5de01')
sha256sums=('190562cd85418b16e9829802aa9133fa721a1fa8af002e53653a0838a24c75d1')

package() {
    # cd "${srcdir}/build"
    msg2 'Installing...'
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
