# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-cc
pkgver=1.14.1
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: default.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-pack')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/04-iosevka-cc-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('0d87e867f0994ed21bdf52378ccf84129c9e33d1b9d8fc486a6c95f37f29f0d6'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
