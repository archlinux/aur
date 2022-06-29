# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4.5.2
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('77614bea79537343337ae0f7618257c29db757fcf99087cd082157cfb7850e54')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

