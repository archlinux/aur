# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=0.9.0
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

md5sums=('61aee44b7b566c6080a9fe6f33db0dde')
sha256sums=('d012dc5654ff5f3a4bf6fcfa9a3bfa1457d07d419cbed14bef389d4b3ce1c8ba')

package() {
    # cd "${srcdir}/build"
    msg2 'Installing...'
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
