# Maintainer: BeetleBot <nikarabilla@gmail.com>
pkgname=fount-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A terminal-based Fountain screenplay editor (Binary)"
arch=('x86_64')
url="https://github.com/BeetleBot/FountCLI"
license=('GPL3')
provides=('fount')
conflicts=('fount')
# We point to the Fount-Linux-x64.tar.gz from your GitHub release
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Fount-Linux-x64.tar.gz")
sha256sums=('a27293cde27a4b6fe207c340498666da8e2a09a804ea2de758a2c6d023ffa837')
package() {
  install -Dm755 "${srcdir}/fount" "${pkgdir}/usr/bin/fount"
  install -Dm644 "${srcdir}/assets/linux/fount.desktop" "${pkgdir}/usr/share/applications/fount.desktop"
  install -Dm644 "${srcdir}/assets/icons/FountCLI_Logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fount.png"
}
