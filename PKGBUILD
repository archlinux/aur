# Maintainer: BeetleBot <nikarabilla@gmail.com>
pkgname=fount-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="A terminal-based Fountain screenplay editor (Binary)"
arch=('x86_64')
url="https://github.com/BeetleBot/FountTUI"
license=('GPL3')
provides=('fount')
conflicts=('fount')
# We point to the Fount-Linux-x64.tar.gz from your GitHub release
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Fount-Linux-x64.tar.gz")
sha256sums=('c9ae2b49ac3fc8fcdab636c58b27afd6170b0819e0480c2dc8f3392fe6e976c1')
package() {
  install -Dm755 "${srcdir}/fount" "${pkgdir}/usr/bin/fount"
  install -Dm644 "${srcdir}/fount.desktop" "${pkgdir}/usr/share/applications/fount.desktop"
  install -Dm644 "${srcdir}/FountTUI_Logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fount.png"
}
