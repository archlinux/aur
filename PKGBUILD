# Maintainer: BeetleBot <nikarabilla@gmail.com>
pkgname=fount-bin
pkgver=0.8.4
pkgrel=2
pkgdesc="A terminal-based Fountain screenplay editor (Binary)"
arch=('x86_64')
url="https://github.com/BeetleBot/FountTUI"
license=('GPL3')
provides=('fount')
conflicts=('fount')
# We point to the Fount-Linux-x64.tar.gz from your GitHub release
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Fount-Linux-x64.tar.gz")
sha256sums=('99b2e0ef9c93cde39be6be27ac21c92d616ce757f6e43cacae1ae1a86dcdf5c8')
package() {
  install -Dm755 "${srcdir}/fount" "${pkgdir}/usr/bin/fount"
  install -Dm644 "${srcdir}/fount.desktop" "${pkgdir}/usr/share/applications/fount.desktop"
  install -Dm644 "${srcdir}/Dark-Fount.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fount.png"
}
