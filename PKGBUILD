# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-ss11
pkgver=2.0.1
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: X Windows Fixed'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-ss11-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('059ac75a61e2d40fa6d96b73634cc713502b71c9b390b4a674c85e51f3e4b1e3'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
