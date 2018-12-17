# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-ss07
pkgver=2.0.2
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: Monaco'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-term-ss07-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('1b016e6ad3569e3d9158c53244f1e0cbf20ef091310df567f830e4d8ad259df2'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
