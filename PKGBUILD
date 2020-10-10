# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.9.2
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=()
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts.zip")
sha256sums=('25d7a93aca70754c78e9b88ec7b6185b6bbe9f0a9344f109c4cccb6cea89a9d2')

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/TTF/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
