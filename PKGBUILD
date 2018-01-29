# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.8.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.8.0/fw')
sha256sums=('58961d9bd1edf99dee5fd4b3dd5da5e2b76cfc0f6cbd4f77a190a3e6b09292e7')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

