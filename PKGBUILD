# Maintainer: Zingy Tomato <zingytomato@tutanota.com>

pkgname=harmony
pkgver=0.7.0
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('16525dd1812d715c8af48c1263868c101e85fe1dcd4f12836afaa87825606a85')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}

