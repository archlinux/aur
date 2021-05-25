# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-manuale
pkgver=1.001
pkgrel=3
pkgdesc='Serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/manuale/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-ExtraBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-ExtraBoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-Semibold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Manuale/master/fonts/otf/Manuale-SemiboldItalic.otf')
sha256sums=('6f5869d0892d8c06cabcccce3726cacc849bd0a96b83bef5850402ab2b9fce71'
            'b71e9365de9fc4e330146d4af5e1f0e9e53559b7fcce60f0b656288a0c1d0fe4'
            '419b09b1794f3d84b227a9a32c9c217950ec78aa94c3b07ad25f3b378eeb2333'
            '353228a0d33bfa3e8ce8d44b2fc95d77fd4ebc20c4a1d03dab7b5f22106c5258'
            '7a2df4500ce8cc1dcac9bc1a28aef486ec85000c332ec2021c72e01430350883'
            'b625fd177d30b5a8a04f141ea77c6b0171029bc989a64d0269eb540eb1b5b2fd'
            'e9c2535e93ac5e9142ea161a8091048249d97dc6a6d8fa89f9e54b09651e20ad'
            '4a697982e018e16ca88b20befccd69fa19951128327b0c78589686a6fd2dff4e'
            'ef1ed0a724e0a48dc2d0dfbdee988780e0b5aec075005a82e99b929d21577d71'
            'e22a2244ddbd22967b2fe1885272c5cf13918648f24950b65e18caa396e3c901'
            '2de60e761c808dc9392d0207a9a2d22f40cfef39d8a60f62ea28be6c1abde117'
            'ff0bcde51a4c161bcfb3c106aa5894b6bd2d72bc3a7c0a4d26ccb0939cdc67c7'
            '9e90af61118ddf8b2387202779e7ea2757dde9c90e5ca52d08237ae81029d57d')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
