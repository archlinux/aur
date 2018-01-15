# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-sarasa-gothic-ttf
pkgver=0.4.0
pkgrel=1
pkgdesc='A Chinese & Japanese programming font based on Iosevka and Source Han Sans.'
arch=('any')
url='https://github.com/be5invis/Sarasa-Gothic'
license=('BSD')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v${pkgver}/sarasa-gothic-ttf-${pkgver}.7z"
        "https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/master/LICENSE")
sha256sums=('62d8bfb3172e10c8f16de98ef6e63ab859f360ba8a6994aeca033afc3de6c633'
            'eca465adf57723ec59a8230044af3cef5a1ad11982f1198e06243aca22513b9f')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
