# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4.2
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('622311c4a8135aa281794488b6492fc11e912358f8f49120ac8d3d07c485d834')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

