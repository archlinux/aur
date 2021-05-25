# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-faustina
pkgver=1.008
pkgrel=1
pkgdesc='Serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/faustina/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-ExtraBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-ExtraBoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-SemiBoldItalic.otf')
sha256sums=('73f1067ce6357d5da461e7973e7fc1092fbf44212730b77759b1b9a4f39466ec'
            '3be6c3ee343aaeae5443768413c15f5ce609320e6cd7615bd4ae8a43784d51fa'
            '1d362ed00fcee6203ef0ca2e0d753aa73a9c95749e87dcf3de1dea301e95cc7e'
            'dfb6b1204b4dbacb0506f086bc714c89fd53aca07ad2b87de8dc8b8a3295c05f'
            '754f349ebbfbd61d38fe62883ae87f9631186ef932eda62e07916aac4c759e55'
            'df1305ae6fa6c8fafef44f3490b8c138068e03f7895ed3ada02a7b6967eebedd'
            '8259d3569a0e014a526620afef1a6f60b4c741899d268f0ecaf2725356a289be'
            '318bdb647fdf7d033b1296f1da051770fdfa5eca96379b16b4f92550aec300d4'
            '89c3187d418b17083e051504acae9085b19de743da9745f8d3f7e992c6922981'
            'a328bb6a8e00709cf053b79664eed5be7a27392c30e0f9e571a77cf016cb830c'
            '5bf7bfc8bd306ed466df5539d7448008e99c81e715e88c5968e5658129a72db0'
            '1c8ab369603d2efdfdd2d28af9160f72283548521d16fbf554bb72cd89491a61'
            '05e75030a5e8066e7d33368bcad985346d3121eed56226927b4fe8016664c313')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
