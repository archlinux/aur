# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-slab
pkgver=2.001
pkgrel=1
epoch=3
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
source=("${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt::https://raw.github.com/googlefonts/robotoslab/master/LICENSE.txt"
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Black.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Bold.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-ExtraBold.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-ExtraLight.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Light.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Medium.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Regular.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-SemiBold.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Thin.ttf')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '2f28ff96dbee95f6efdfa9b0c28b0bfa49a5afac07f6b11b0560dff4be3a0b78'
            'e27595c62f218e8c75e9f53ae50c5cfe259d95ba35dd84cc9a4843feb9d1ed80'
            '5e910236974031f64738e4e7a122319cefabfe3d402214089d07657afe339514'
            '0c8643dd04fde24e8b7a8cec8b9ad9de1f90f2b88d1d9993c4507f1a0b19cee8'
            '7987e014d49097a12c7027b41ec4e1c158606bd4bb3f645af272f9f828db9227'
            'c121e1a28963744ac2da3b5784f841d309a8ba491c454efaf2f6e4580a6ae111'
            '994cedaa50dd7cd4f16a047295a222a6bad55e647ba769f1eb8b39a81263408f'
            '33c4ede46609eb172fddb5968bbf0e0ce5e458656ad3e6db7f52de789cad52ab'
            '048148ed028b54bdfd11d4b9ff1b2e52ac730b2017a022741db78ee9ba0f808f')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
