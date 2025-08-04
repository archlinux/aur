pkgname=harmony
pkgver=0.7.1
pkgrel=1
pkgdesc="An open souce CLI music streamer based on MPV."
arch=('any')
url="https://github.com/ZingyTomato/Harmony-Music"
license=('GPL')
depends=('mpv' 'python')
source=("${pkgname}::https://github.com/ZingyTomato/Harmony-Music/releases/download/v${pkgver}/harmony")
sha256sums=('b9eb1afed7172255fb591009255f5d411b8d903e41c06f77d4468d3b58c92d36')

package() {
    install -Dm755 harmony "${pkgdir}/usr/local/bin/harmony"

}
