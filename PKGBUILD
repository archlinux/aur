# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4.3
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('7926df5c8415796a35ee36bee83a9c1ecd45794be6318b60bcfdeb263cf12e16')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

