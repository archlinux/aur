# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-grenze
pkgver=1.001
pkgrel=2
pkgdesc='A hybrid typeface family between Roman and Blackletter styles from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/grenze/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-Black.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-BlackItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-ExtraBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-ExtraBoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-ExtraLight.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-ExtraLightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-SemiBoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-Thin.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze/master/fonts/otf/Grenze-ThinItalic.otf')
sha256sums=('3b84fe60cf47615bda9710f47d81f8935544b021f0a4846b2518489b2d2ea1a4'
            '93cfb54cf9ae4640a73ecfd754498f891bd1f3c691327e1bbdfcb9c05c51064f'
            '6a6a08cf36e69b4af07b5812abfd488233e465893631ab18f17eea806b89f697'
            '3e62d0d7625fac6e95fe7908245bbbeaa2e2b9de054cf659f49389b0ed5be57e'
            'f42e92ef1f053ab071a7460c77575117fa5a793b70a5e837a484f8b3fa2015a7'
            '32b253bea247e469037ce9033e8b766f2e1cbfa44ebaf585384569de9f860a9b'
            '5e55ad143b1bf8e6550d180789f32a7729c67d4890af1a0ae79b1622266361d5'
            '57f07c2868c9cf77d079b71ba98303cb006a5c87e80868ad641f7f79f3cb45a7'
            '9f66750010df73b417a13bcf70eebf28ba729f74df18161f8d153d4eeea3688e'
            'f23851f74468fad967e7a72cffc1448e3caa2fb6fc3dcb6eff7c69ce4aef22ca'
            '15a51a182a505f4cb7dfea0979edd1391fcd6d10edb227ede4d081ed596d5eb3'
            '7b308f0d72ec062941ef14f438d770055f6874e1858f3f312d4369fb4b247463'
            'af94320260a9ded48f779da5af83b130777d92ea6ac65d2d8a11c84e9aa76cfb'
            '8830701b37d117489cbebf13626eafc2146d0ae9215da19af0a387fb3b598f43'
            'af365b6536439d4759b4195032299ebeba7c0a63f90d67d84e033ab5c967f251'
            '7bdb700a68d1eeab3bfeb6c76d4b38d65699ebe082b18013276299d201e8cd58'
            '8bd3a3f9e6484e03f30e10e82935a08096235ca714784d3a3b020821db787837'
            '2e3a4c06d7f767fc2d9e46e52984cbd83aecb58ac23aa203bfa85583272af7b4'
            '5cdb1b3cd079877b323cc9bf27a62979acd1376dc001d64c5d241a801939105c')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
