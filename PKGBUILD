# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4
pkgrel=1
pkgdesc="An open souce video/music streamer based on MPV and piped."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python-requests' 'python-pip')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('bcb325f910139ab8e0c1538ea368e94dffde010125b2ef66fcc5b935bb96ff4c')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

