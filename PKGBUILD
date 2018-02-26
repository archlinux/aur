# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-sarasa-gothic-ttf
pkgver=0.5.1
pkgrel=1
pkgdesc='A Chinese & Japanese programming font based on Iosevka and Source Han Sans.'
arch=('any')
url='https://github.com/be5invis/Sarasa-Gothic'
license=('BSD')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v${pkgver}/sarasa-gothic-ttf-${pkgver}.7z"
        "https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/master/LICENSE")
sha256sums=('969af6469c729090033fae39d15d2661c528cb9bfd82529b590bf0b6fa50b754'
            'eca465adf57723ec59a8230044af3cef5a1ad11982f1198e06243aca22513b9f')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
