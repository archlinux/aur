# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.19.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=()
source=("CozetteFonts${pkgver}.zip::https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts.zip")

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/TTF/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
sha256sums=('988ba22b8d72dca9afacc86d848755ce81daec752d7d471533264bec5d04c21a')
