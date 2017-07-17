# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-inziu-iosevka-ttfs
pkgver=1.13.2
pkgrel=1
pkgdesc='A composite of Iosevka, M+ and Source Han Sans.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://7xpdnl.dl1.z0.glb.clouddn.com/inziu-iosevka-ttfs-${pkgver}.7z"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('e7bff840f03156733ccd0408f924899a1004c232dcce60d5c3f07573cc70a45b'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
