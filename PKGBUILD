# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-sarasa-gothic-ttc
pkgver=0.4.0
pkgrel=1
pkgdesc='A Chinese & Japanese programming font based on Iosevka and Source Han Sans.'
arch=('any')
url='https://github.com/be5invis/Sarasa-Gothic'
license=('BSD')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v${pkgver}/sarasa-gothic-ttc-${pkgver}.7z"
        "https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/master/LICENSE")
sha256sums=('99aae6c8e0e7c1f9b9f912ead0e9e7c9e992f514bec6ee260164f94d8562c15e'
            'eca465adf57723ec59a8230044af3cef5a1ad11982f1198e06243aca22513b9f')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTC/
    install -m644 ${srcdir}/*.ttc ${pkgdir}/usr/share/fonts/TTC/
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
