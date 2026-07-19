# Maintainer: Alex <alexboot22@gmail.com>
pkgname=openmediabridge
pkgver=2.0
pkgrel=1
pkgdesc="Bridge media playback and synchronized lyrics to WebSocket clients via MPRIS. For Resonite VR, OBS overlays, and Discord status."
arch=('x86_64')
url="https://github.com/alexvermaning0/OpenMediaBridge"
license=('MIT')
depends=('playerctl')
source=("OpenMediaBridge-${pkgver}-linux-x64.zip::https://github.com/alexvermaning0/OpenMediaBridge/releases/download/${pkgver}/OpenMediaBridge-Linux.zip")
sha256sums=('77f4231db320e9a30957182855ccb699b38901028f57791304eded1615720cb2')

package() {
    install -Dm755 "${srcdir}/OpenMediaBridge" "${pkgdir}/usr/bin/openmediabridge"
}
