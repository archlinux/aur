# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.16.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.16.0/fw')
sha256sums=('8ea75beae8a966cf551112b09ff53e77ab8beaa64026e264a39d893bc52fa90d')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

