# Maintainer: jaskir
# PLACEHOLDER UNTIL RELEASE
pkgname=wayle-bin
_pkgname=wayle
pkgver=0.1.0
pkgrel=1
pkgdesc="A highly configurable Wayland panel/bar. (early development)"
arch=('x86_64')
url="https://github.com/Jas-SinghFSU/wayle"
license=('GPL-3.0-only')
depends=('gtk4')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
