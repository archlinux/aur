# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-archivo-black
pkgver=1.101
pkgrel=1
pkgdesc='Grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo-black/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/master/fonts/otf/ArchivoBlack-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/master/fonts/otf/ArchivoBlack-Regular.otf')
sha256sums=('000a3db5300ab7645fb1f861061987f7a4320939ae733d5c29aab3df6a281447'
            '86a87539036ee3d205ef10cc50f25fce5a33e84100708b02b6f78b6fc1994e87'
            '10e18da452766dee8542b40ed6055f0013ede6548bb84df6fa2fa278e4adea92')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
