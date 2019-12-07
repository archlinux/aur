# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-asap
pkgver=2.0
pkgrel=2
pkgdesc='A contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('https://raw.githubusercontent.com/Omnibus-Type/Asap/master/OFL.txt'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/otf/Asap-SemiBoldItalic.otf')
sha256sums=('4c510861f0b2d6665fb0ff8130cec24f1537ad644b3af32b02f28b13d82511a1'
            'd72efbbff1dbdab5445f7a116aa29f93f5c549270c0acda9b0915acd50050f41'
            'c6f66c4b0cb0bfdbba092d3290a5fb495e2238d2271ebed0b88c74e0ad255c8c'
            'a0c7fd714951e3defe69cd40ec967a58be1dab012e1fb6b6bf977338fdb369d1'
            '276e81fd70894a4dd941086e2500f9d1232fb33d61015731c6fbdaeac92a9976'
            'fb1ec8db54058488dc255737c6b1243fd1800b5ed8509185b21bae33ca8bc25e'
            'deccda4fc69c2564d023b4d899b8f061f8205e7464193ff254502d660fcabc22'
            'dfa19448910f782e036a77f98e87be41a7896a98b33c2165e665549913fa14de'
            '56f7998da5d0ce28c18f5670d762d4a4ea19f80197615f9b2fda990161871c08')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
