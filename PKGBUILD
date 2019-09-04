# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.1.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/2.1.0/fw')
sha256sums=('b9c6fd869c486b5ccfa0b3336400f69ff89e91ede277ef827529d8f90cae9a23')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

