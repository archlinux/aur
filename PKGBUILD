# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-rosario
pkgver=1.201
pkgrel=2
pkgdesc='Sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/rosario/'
license=('OFL')
_commit='d8bf83600979c82357d8023243d3d01a386fc7fe'
source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/LICENSE.md"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/otf/Rosario-SemiBoldItalic.otf")
sha256sums=('03a0ecffec02fa4ee8286b929df620c7a8803a8bea8021c9edb5bcdedd043549'
            '3c1e1b98e6c86ffbb03f292d8a011767a11db2ae2f710d8e22780ed3ba822dd7'
            'd371600ff34bbf44acf33b89341bf9b2d35ce174c3b18c9881337bb25a7d5bf2'
            '9ea6699d897cd130ece400c606d60109230d21b930a987b65a613b8567ff9a35'
            '4d7b9cdbbaa0868cc97a8de39d5b02dc7e192a34ae6f492599f8542e6d9c4e8b'
            'd5d98e1d7b552136338cdec27f5040cdc18a7da800ffa2a961c8215df99598ed'
            '9f3aa363b0ee5db18b0ff36ea13528f6a1036a7161b4209d01400b8842cba918'
            'f3c0f5d84709ff6b00ff324f17fb4a20fbd23946e572c6f115b77a7eb3770e43'
            'e3c6338c3e6fad2b590e83e98df767ab3682c1ea4586f08fbf0e11d6844a335b')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
