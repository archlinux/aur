# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.29.0
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
sha256sums=('1c7eb7c0117b6ac4955e1a2465bb6f94e08445509f4f595b2651ebdabca0c778')
