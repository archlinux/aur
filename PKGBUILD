pkgname=ttf-proggy-vector
pkgver=1.1.5
_pkgname=proggyfonts-${pkgver}
pkgrel=1
pkgdesc="Proggy Vector is Monospaced, Fixed-width TrueType font optimized for C,C++ programming."
arch=('any')
url="https://github.com/bluescan/proggyfonts"
license=('MIT')
install=${pkgname}.install
source=("https://github.com/bluescan/proggyfonts/archive/v${pkgver}.zip")
md5sums=('SKIP')

package(){
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -d "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 "${srcdir}/${_pkgname}/ProggyVector/ProggyVector_Readme_And_Licensing.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "${srcdir}/${_pkgname}/ProggyVector/ProggyVector Regular.ttf" "${pkgdir}/usr/share/fonts/TTF" 
}