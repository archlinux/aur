# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4.5.1
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('9b9eb0ed7677308370ab934d83329568a8fe0f9012f09f4ac234c2c0e926a737')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

