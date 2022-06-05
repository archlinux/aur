# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.4.5
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('81db127a67dd71b1f2358d4e2f1522d3d3b55a71aa8299dea1d7bb77d0206844')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

