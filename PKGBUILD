# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-ss08
pkgver=2.2.0
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: Pragmata Pro'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-term-ss08-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('33a0a63c79ae6132c765ac986b81a682a32af7ced2d7e9e57bdb8871eedc27e8'
            'ecfd74a1d6749bf509cee122870da0186bccfae446e3f6bc5faff253577ab000')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
