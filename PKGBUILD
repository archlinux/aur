# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-chivo-variable
pkgver=2.002
pkgrel=1
pkgdesc='Grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/chivo/'
license=('OFL')
_commit='384c6d3ad00f76be6f76f998a310335e3eb460a2'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/variable/Chivo-Italic[wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/variable/Chivo[wght].ttf")

sha256sums=('c9b69fa18c372df2b187b49efc57b1ea643b86a938e5af32f6b5a7af1017c891'
            '502339e1cda77e24b5cd46a1a875e4c5e6f20ea019c248f57f23423527030ff3'
            '801674cbeff749011a0186b2c932dc9158187a8ca4ca6598db2a1f5c7c4342d1')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
