# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-asap-condensed
pkgver=2.001
pkgrel=2
pkgdesc='A contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap-condensed/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/AsapCondensed/master/fonts/otf/AsapCondensed-SemiBoldItalic.otf')
sha256sums=('1e6fc63faf780ac82354f94a9aee1579ed199c07ebedae3b82e6191a7c3b4ae0'
            'abf8858aca7ac8ffe8da6061152f972169495d7431ca479ed9d8589c45a6fca6'
            '4284a9fa94f627895c5ef8d39e5678891652c4990bfe055e9a59f6346bdc7972'
            'b6a6798e3fb59790ac921fedd7b9391c2d142d234c7938744fdf0c2fe82e0daf'
            '4bafb61af10904ca7f05be218151bd4b2be850cffdeac06bfbf96231d2ec9a25'
            '2245961a683226f99683708dce9ff1dcb1886be77b9f4826be0d762f293b3c03'
            '6f46abfeac0735c9c8aa4f1e35fa9452c2f66899115e3dab130274d2d0eefae3'
            '23186542617d19a40139197af2afa3b26fde7142a641d6e3b7a262249e4bf122'
            '13109c91089017e11b63d84c5c6a9e99487768133ca3d4a9c58f9f06f4c3f2b0')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
