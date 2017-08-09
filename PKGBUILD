# Maintainer: Jimmy Hu <jimmyhu.co@gmail.com>
pkgname=ttf-iosevka-haskell
pkgver=1.13.2
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: Pragmata Pro + Haskell'
arch=('any')
url='https://github.com/jimmyhuco/Iosevka'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka'
           'ttf-iosevka-pack'
           'ttf-iosevka-ss01'
           'ttf-iosevka-ss02'
           'ttf-iosevka-ss03'
           'ttf-iosevka-ss04'
           'ttf-iosevka-ss05'
           'ttf-iosevka-ss06'
           'ttf-iosevka-ss07'
           'ttf-iosevka-ss08'
           'ttf-iosevka-ss09'
           'ttf-iosevka-ss10'
           'ttf-iosevka-ss11')
source=("https://github.com/jimmyhuco/Iosevka/releases/download/v1.13.2-haskell/iosevka-haskell.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md"
        "https://raw.githubusercontent.com/jimmyhuco/Iosevka/master/iosevka-haskell.el")
sha256sums=('7dd4a57a37815b7d7513f7b429e0e936c2e9ddb9b4a0b7b2b2fdc41681b81392'
            'a7a0e1da98ab1bae99a1f246f45e51720e0cc13a53b4a5b0692f64991d2191af'
            '59a8b1e48cbfe5589a298dedaa5503d188a1a2ca2520cdffce390a271f0791ef')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/iosevka-haskell/ttf/*.ttf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
    install -D -m644 ${srcdir}/iosevka-haskell.el ${pkgdir}/usr/share/fonts/${pkgname}/iosevka-haskell.el
}
