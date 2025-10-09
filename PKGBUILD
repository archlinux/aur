# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.30.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=()
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts-v-${pkgver//./-}.zip")

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/TTF/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
sha256sums=('c1515e63ba969d6099168c7a57b68c642025a73cd5112c39f62112d2dd16b709')
