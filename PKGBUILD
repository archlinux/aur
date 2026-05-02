# Maintainer: BeetleBot <nikarabilla@gmail.com>
pkgname=fount-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="A terminal-based Fountain screenplay editor (Binary)"
arch=('x86_64')
url="https://github.com/BeetleBot/FountTUI"
license=('GPL3')
provides=('fount')
conflicts=('fount')
# We point to the Fount-Linux-x64.tar.gz from your GitHub release
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Fount-Linux-x64.tar.gz")
sha256sums=('b25e8f50a525d0ec0c301c4639b0506f06e56fe218b695c85b20c62ac6b9383b')
package() {
  install -Dm755 "${srcdir}/fount" "${pkgdir}/usr/bin/fount"
  install -Dm644 "${srcdir}/fount.desktop" "${pkgdir}/usr/share/applications/fount.desktop"
  install -Dm644 "${srcdir}/FountTUI_Logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fount.png"
}
