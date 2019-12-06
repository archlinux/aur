# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-slab
pkgver=2.000
pkgrel=1
epoch=3
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
source=('https://raw.github.com/googlefonts/robotoslab/master/LICENSE.txt'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/static/RobotoSlab-Bold.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/static/RobotoSlab-Light.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/static/RobotoSlab-Regular.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/static/RobotoSlab-Thin.ttf')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'a46eca66ae13b1774b25b23315900b3e30fa32efd6684fe46aff22d333f78ebb'
            '02d9f4a0ea88810ba77ee624db42494348325980f7a5d1f50b66852e22920ca5'
            'ace53f5b158b80dbf2539696b0f448975d95c1a48f8b30d494e2d45923e4ae23'
            '8db8b4095e4a76b5368b51276802a4ba33664c4908526996d83c87ffa22da4b4')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
