# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=0.10.1
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

md5sums=('305d58cf5d50a34d13565e0cce5cc2b7')
sha256sums=('efdb23960ec7d7dffe5a9a7b9ba84e8cbfec28dfde92cee78abfd2e1c3631a8e')

package() {
    # cd "${srcdir}/build"
    msg2 'Installing...'
    install -Dm755 "${srcdir}/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
