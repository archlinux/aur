# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.0.1
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/2.0.1/fw')
sha256sums=('f5cbf0f6c1dc8cdc46a8c29c2c05ab99e38b497c8cbba100fb0b94588690bf05')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

