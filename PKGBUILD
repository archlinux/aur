# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.3.1
pkgrel=1
pkgdesc="An open souce video/music streamer based on MPV and piped."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'yt-dlp' 'python-requests')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('6393ceaf04d76844d5b7a4198b01e4f294aa9fde39768acb6b624226012b96da')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

