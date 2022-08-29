# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-chivo
pkgver=1.007
pkgrel=4
pkgdesc='Neo-grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/chivo/'
license=('OFL')
_commit='dc4c121859ac06c32b03b9630f50a22b5b562cb9'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-BlackItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-Thin.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/otf/Chivo-ThinItalic.otf")
sha256sums=('5e4ab199aee98d04ca9bed9088b793291dd03e4d775876012ab4f14de77af3fa'
            '7422b4fc763fcf3b39def541a68d125ebd4cf67291591c4ea996bdce29719f02'
            '08fa6e4e7a319fdb5c162c117689001789aa9d59cbb68bbdaf2ee41f91b3dcda'
            'bef538ebc639428c486744974a8d4a64b89bb57e3dd652d64cb4e1ca0bc7cc26'
            '11b1dba7a710c3b8d2c79500915ebac3ac75427416895f1930750bfba00c384a'
            'e35299e0507b91f2568bf2d980489389a3bf209fc5defa9ea983c70c2af9fb5b'
            'c67711e8e9ca68378ef9d12263df857a2706de64cb3c17c35e4a96c557db519d'
            'a012ded56460c2217ed1721402b6ecbcd2e13e927532eb7bf0e2c804532ad20b'
            'ecfeddc67246e456cb21f66b5292707b14c4f4aad3c6433e2c700a4b4f13c78e'
            '055f85243357a2774d16601d2e277c6f593eb387cf9a5a03d8cfcf901b5071f7'
            '7bcba3eddebf37c9ac4b21282ac06dea567db0c5c037c8d308de64cbb995e14f'
            '19655c63b79aa1c227c141f1b9a4b1857cc218779cf994b119c0557381cede18'
            '939103d6fc241ea004caf97de45ab96d244be08f786f80c0e17b178ca90dd2db'
            'ab3ee1b2844a5cc8f222168508340cf82074cce26edc3bb128e22e8d22464fce'
            '66ca22bf6efc86395a83fd3b5d87e018067a98a543257b214edc2752e0044202')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
