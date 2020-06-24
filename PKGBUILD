# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>
pkgname=cozette-otb
pkgver=1.8.3
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts.zip")
sha256sums=('eb92125d1defca47e8cca57db47534fbbf0afa725adc1738c6263beb92f81769')

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
