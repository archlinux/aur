# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka
pkgver=1.14.1
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: default.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-pack'
           'ttf-iosevka-ss01'
           'ttf-iosevka-ss02'
           'ttf-iosevka-ss03'
           'ttf-iosevka-ss04'
           'ttf-iosevka-ss05'
           'ttf-iosevka-ss06'
           'ttf-iosevka-ss07'
           'ttf-iosevka-ss08'
           'ttf-iosevka-ss09'
           'ttf-iosevka-ss10'
           'ttf-iosevka-ss11')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/01-iosevka-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('adc07c4b3199aa3e26de86109a95a8a9468e75252b3bb0791db82ff967029896'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
