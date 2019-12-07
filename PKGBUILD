# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-rosario
pkgver=1.100
pkgrel=2
pkgdesc='A sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/rosario/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-SemiBoldItalic.otf')
sha256sums=('944998f475ee63b332a19137840d9e334c94ec6300f8091a5049a647798ca33a'
            'e77b03174db63ea9455cfec859d09035d946d96f9c668bad179321491b839a74'
            '0fdf1d087b579e26c02529e00f6f8522770a6f6e86093e2a5c6207194254f6f5'
            '4c13479bd33f0f4de873c3f4a9f5032d7e7192c8db3dd06c69415e3d7f83064d'
            'e91d429aa2e6db475652eb267b9d3f26aa5c6397a335a52b2dc2c1383dd97931'
            '444ffdb5511337060829a31542e83a2ba0ab150c88fd7716837adfca91a91390'
            'e69b3df4a6f419583c20471cc990a0abf14d6b9cb40a292a776a92b599bc0db8'
            '47718c89331f6871d655b1158cfa9b662087b7192e10c5fa01b8f7f1fbdb535a'
            '11ec3356f9c1f835b6687c895c74a1861140b8a790595975c8edbbb37648a630')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
