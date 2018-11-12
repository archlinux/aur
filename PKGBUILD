# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.14.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.14.0/fw')
sha256sums=('02ca1a356561a3bb26c8284caa2e2c7aa624f3dd7d625a44223a16e1ae0b1a97')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

