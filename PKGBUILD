# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-archivo-narrow
pkgver=2.000
pkgrel=1
pkgdesc='A grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo-narrow/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/OFL.txt'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-SemiBoldItalic.otf')
sha256sums=('1f19fae3e59d403f53162b0b161eb345ebee3080757fc754e4e3c022e8ab3bdf'
            'eb9df80ed2a96133f3e61eeea46297f0f0fa849ced70cbe3b219a958ce1fb925'
            'ad1522c7177e7733584cbda86bdf82f72413fe807a8c9a8e867faeb8b337c354'
            'e9b1929c562734c578f6a4d13ca24b9bc3e9ffbd36bae1e90214b5953fc57199'
            '35b6f295ada2e3710f4649c78727e9241c65bb2393379b7a14748d1c0619c529'
            '87711583a6f16b14444c84cfa27cf2985f2b916861f1854a4c47436047271f09'
            '402fadb4b467a0370019c3c250506d5f1cef7b31a50112f52cb199499b5e760a'
            'c3056e11086fdbf1d6ff5ee9f01ad9fa72c982f55ba219781cf57ca418fd91ed'
            '3762584f30686f7d6d395159ea1eaabaf6283d90c9594ca05a8043dc9ca7a524')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
