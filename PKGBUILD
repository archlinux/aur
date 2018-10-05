# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-ss03
pkgver=2.0.1
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: Consolas'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-ss03-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('33ce151233617220b4aeb0d5b621d85659fb68a9427f7baf8e9a57f6e93f87d1'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
