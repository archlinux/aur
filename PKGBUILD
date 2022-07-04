# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4.5.3
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('97ec34f7c868b29d9dd69d26d806ae74cdc749f411f1bef1f686a332319ab812')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

