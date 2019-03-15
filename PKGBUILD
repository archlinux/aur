# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-ss07
pkgver=2.2.0
pkgrel=2
pkgdesc='A slender monospace typeface. Shape: Monaco'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-ss07-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('e93b53f3cb1d71d0f7446550a3f8f0f15ae78d704b42bafdf407cac7ebbb97a6'
            'ecfd74a1d6749bf509cee122870da0186bccfae446e3f6bc5faff253577ab000')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
