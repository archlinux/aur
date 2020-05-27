# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.8.1
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts.zip")
sha256sums=('4f2407018abf2014d868200922eee443820fea46c0d0b351a43eb8c562a024ad')

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/TTF/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
