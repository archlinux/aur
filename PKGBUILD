# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-pack
pkgver=1.13.0
pkgrel=5
pkgdesc='A slender monospace typeface. Shape: default.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka'
           'ttf-iosevka-cc'
           'ttf-iosevka-cc-slab'
           'ttf-iosevka-slab'
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
           'ttf-iosevka-ss11'
           'ttf-iosevka-term'
           'ttf-iosevka-term-slab'
           'ttf-iosevka-term-ss01'
           'ttf-iosevka-term-ss02'
           'ttf-iosevka-term-ss03'
           'ttf-iosevka-term-ss04'
           'ttf-iosevka-term-ss05'
           'ttf-iosevka-term-ss06'
           'ttf-iosevka-term-ss07'
           'ttf-iosevka-term-ss08'
           'ttf-iosevka-term-ss09'
           'ttf-iosevka-term-ss10'
           'ttf-iosevka-term-ss11'
           'ttf-iosevka-type'
           'ttf-iosevka-type-slab')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-pack-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('99ebc9b8d24a9412c6806b1bf671f17eaaaf4e18165cffca98fc9c0082424c0e'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
