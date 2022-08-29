# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-archivo-black
pkgver=1.101
pkgrel=2
pkgdesc='Grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo-black/'
license=('OFL')
_commit='664fff4b76bf4d425178e831a8d1028ba63d8b2a'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/${_commit}/fonts/otf/ArchivoBlack-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/${_commit}/fonts/otf/ArchivoBlack-Regular.otf")
sha256sums=('427ffa501968f3e61220c0cf72a102b9e64872c648c01003fe0f894e180b9318'
            '86a87539036ee3d205ef10cc50f25fce5a33e84100708b02b6f78b6fc1994e87'
            '10e18da452766dee8542b40ed6055f0013ede6548bb84df6fa2fa278e4adea92')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
