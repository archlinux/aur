# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-slab-variable
pkgver=2.002
pkgrel=2
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
_commit='1be6141f85b68b48c06ccac50d234302d6e59643'
source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE.txt::https://raw.github.com/googlefonts/robotoslab/${_commit}/LICENSE.txt"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/variable/RobotoSlab[wght].ttf")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '786ae192477447d33c6672c3055fba7cbfe45184c9a79e77a14f15716ca05b16')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
