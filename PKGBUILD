# Maintainer: erdii <me@erdii.engineering

pkgname=wormhole-gui-bin
pkgver=2.3.1
pkgrel=2
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/wormhole-gui"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/wormhole-gui/releases/download/v${pkgver}/wormhole-gui-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('6c9be72ac5714ef7ef9763da0a69d1a7dbb2f20e88a40f2724bb8a451041b9c6')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/wormhole-gui" "${pkgdir}/usr/bin/wormhole-gui"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/wormhole-gui.png" "${pkgdir}/usr/share/pixmaps/wormhole-gui.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/wormhole-gui.desktop" "${pkgdir}/usr/share/applications/wormhole-gui.desktop"
}
