# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-archivo
pkgver=1.003
pkgrel=2
pkgdesc='A grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Archivo/master/fonts/otf/Archivo-SemiBoldItalic.otf')
sha256sums=('1f19fae3e59d403f53162b0b161eb345ebee3080757fc754e4e3c022e8ab3bdf'
            '031963ab7d05e0a1211cb276892310159005390c6fa31fd37802c737bc08929d'
            '5a170b166132d92a1044e7c70fb9f2a4d6bbaf2170fc0f6f01a89e94dd30de89'
            '19321c1c3153b382b43d56f23ac92d163d4227962d8a40e7634d9105d6f658c0'
            'c9ac55d3da1c9f2e303a6b5766b6a6f1f32a6905307013ecfea1cdc44a624062'
            'e4c42697f418208409e905d71819ed4a88fb70cc236e8c950f5266c90d85b80b'
            '5ffce038754e66ad03acf427a8fe8efc38cbb321f2d246118ed7c7fa3eab6dc1'
            'cf992e9747f6f7a522469532e85d805827260b7df32189512b3d363676fcd0a4'
            '40de11782ee135e542363e912e6560cc77bfd7d981013668ffd1ac2534486209')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
