# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-asap
pkgver=3.000
pkgrel=1
pkgdesc='Contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Asap/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Bold.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-BoldItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Italic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Medium.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-MediumItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Regular.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-SemiBold.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-SemiBoldItalic.ttf')
sha256sums=('994b5a4d5a51d22c95570564db4af5189df0763c24620b2e1ecd3736c27a1ba3'
            '2197a861a6e40f0761871e08998c2a40e2150c9da948e6f22ea0de8a81520439'
            '07eaf75a9b4a58c52f59b92d6308442d9d4e83e0836ba925e1d2a491a8d6e556'
            '87857ec1f73648d9bd82292642e7d29103852488211237d9aaa0fcb310b7abf1'
            '2c9583aa82b8c0b5055e9cf1d0e03679f64fae5084b80103e5a8e38a81ebb345'
            'b73a3b8840bc3f669a6a0fcc165a80d2ad0e52d29a10ee900809dd3ba3f458c0'
            'ce8bb8899e91d40d33db9436188c827d4b33edebb6e14d01ea136fe034889ecf'
            '32f4d6e06162c0a988bf339349218cdf68932109abe74642a7dc97f4115cecbc'
            '9e8f8c1fbba6175e6a71ef569513eacdcebfd82e82dfa49078f0dd6b879d7baa')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
