# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-slab-variable
pkgver=2.001
pkgrel=1
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
source=("${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt::https://raw.github.com/googlefonts/robotoslab/master/LICENSE.txt"
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/variable/RobotoSlab[wght].ttf')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'a4db9abf97c904deefcad88c3b2989296f04e20a11f75345311382fc3b3fceb5')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
