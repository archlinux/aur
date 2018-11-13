# Maintainer: Patrick Haun <bomgar85 at googlemail dot com>

pkgname=dotcopter
pkgver=0.4.2
pkgrel=1
pkgdesc="A small tool to manage dotfile installation."
arch=('x86_64')
url="https://github.com/bomgar/dotcopter"
license=('Apache-2.0')
source=('https://github.com/bomgar/dotcopter/releases/download/0.4.2/dotcopter')
sha256sums=('67a0e6ce7afc5c73a905071a6d8a667c3451966d6d4b152e391614cd20fd990b')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x dotcopter
  cp dotcopter "${pkgdir}/usr/bin/dotcopter"
}

