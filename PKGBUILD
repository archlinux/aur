# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.2.1
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.2.1/fw')
sha256sums=('997cc1c1093f4c0b597bda99fdb164dc8b61d5c4c34639d1343b32e75b000f26')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

