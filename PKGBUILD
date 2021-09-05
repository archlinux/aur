# Maintainer: erdii <me@erdii.engineering

pkgname=wormhole-gui-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/wormhole-gui"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/wormhole-gui/releases/download/v${pkgver}/wormhole-gui-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('0c34ce9cf4adb2d2cc719cb770f29822dbde300ad7acbb382aadd5a32e8898f3')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/wormhole-gui" "${pkgdir}/usr/bin/wormhole-gui"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/wormhole-gui.png" "${pkgdir}/usr/share/pixmaps/wormhole-gui.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/wormhole-gui.desktop" "${pkgdir}/usr/share/applications/wormhole-gui.desktop"
}
