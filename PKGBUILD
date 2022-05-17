# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4.1
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('3d6602eb420280bbc8a34884d306106b1bd94b4e7b513d5ea5b42cb321268711')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

