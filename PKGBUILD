# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-manuale
pkgver=1.001
pkgrel=2
pkgdesc='A serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/manuale/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
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
            'e59dec2cd10f9db1ab18c4e00b522e1aa9afb25d42009823dfb2ac841a187342'
            '1f9b46d33ce29e5f34c5b1ab20f42a049aa16b208693a6d41b7cb090fd41666a'
            '3a6c31ad38e6702aa2b0202f63542c49a4a99a198d71ecd75f419a3bc06e2ed0'
            'eef9c0c2a9eadecccd4ee0cc1911cf75a4d83c8c73bc9081e7e350a336ee0fa0'
            '0443b381f0155cbcfbe1a6e4206adf1a5fb8fabd6d289725ea234f2d1096d195'
            '4801a68b67d0dccbd9fe48e2d64ab24282177bcdfd2fc735fe57cdb623f1659b'
            'e2039c5f2795df990bee60e40ca06d3e77385518dd156f1cbff36452a0fde49c'
            '285ea80f3b214b1b4eb379cd34588935a030cefe1efbecc33d4d31d2a5fcc079'
            '31572828eabcd4db71af7f500ffb7973d15ec59b00f5187f708ae037d93e5e43'
            'f2ed556087a186d2644026b3aa4c762a036437652f2b36faa4eab04f5fe1a17c'
            '9440fb7e62d16017cec637748686ee0cb6e455e5fd56c115b6e1b7274c6da852'
            '66c869ff91ce8f4501e2ea5639a675d88659574c24f6caa7dd575e39eeb39ad4')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
