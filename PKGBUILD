# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-inziu-iosevka-ttfs
pkgver=1.13.3
pkgrel=1
pkgdesc='A composite of Iosevka, M+ and Source Han Sans.'
arch=('any')
url='https://be5invis.github.io/Iosevka/inziu.html'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://7xpdnl.dl1.z0.glb.clouddn.com/inziu-iosevka-ttfs-${pkgver}.7z"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('2e960c18fd22b6c7b057cc4053e75da7552bee819d52518d481fcdfd1913017b'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
