# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=0.7.2
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
source=("https://github.com/ValeLint/${_pkgname}/releases/download/${pkgver}/Linux-64bit.tar.gz"
        "https://raw.githubusercontent.com/ValeLint/${_pkgname}/${pkgver}/LICENSE")
sha256sums=('a0541fb30832f0bb00ef2bed84975b7a81f59045d5bc0d65cb07b2e0970493a7'
            'd31c15ed03ff47d177c941c6ad8ed836d1cdcce5b7933509a1f1b744583eb95e')

package() {
    # cd "${srcdir}/build"
    msg2 'Installing...'
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
}
