# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.9.1
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.9.1/fw')
sha256sums=('57c23edaf570a9101ceeeb986e3c170522fa936a7bf58819f5b8a5a96a638d86')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

