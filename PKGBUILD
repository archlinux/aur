# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.4.1
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.4.1/fw')
sha256sums=('f6021a5db34941ad5cd7b4009981a874b17fc064705dce4a79b3ddce7dc7327c')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

