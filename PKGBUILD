# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-ss06
pkgver=1.13.3
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: Liberation Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka'
           'ttf-iosevka-pack'
           'ttf-iosevka-ss01'
           'ttf-iosevka-ss02'
           'ttf-iosevka-ss03'
           'ttf-iosevka-ss04'
           'ttf-iosevka-ss05'
           'ttf-iosevka-ss07'
           'ttf-iosevka-ss08'
           'ttf-iosevka-ss09'
           'ttf-iosevka-ss10'
           'ttf-iosevka-ss11')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-ss06-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('5e6f0fbb3c4527de2e878f1b4128a265e1895a43d387c4566c8c6c8260405d8f'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
