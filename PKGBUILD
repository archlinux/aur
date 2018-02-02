# Maintainer: Patrick Haun <bomgar85 at googlemail dot com>

pkgname=dotcopter
pkgver=0.3.0
pkgrel=1
pkgdesc="A small tool to manage dotfile installation."
arch=('x86_64')
url="https://github.com/bomgar/dotcopter"
license=('Apache-2.0')
source=('https://github.com/bomgar/dotcopter/releases/download/0.3.0/dotcopter')
sha256sums=('65acc88a90b39b91e768252edeb5d0f10d66cc95a11403685fd01f1fa93305a9')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x dotcopter
  cp dotcopter "${pkgdir}/usr/bin/dotcopter"
}

