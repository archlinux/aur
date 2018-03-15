# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.9.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.9.0/fw')
sha256sums=('394c126931d02591aa76425ecda84870717a79cc0e107786f8f5bc834cd1fc9b')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

