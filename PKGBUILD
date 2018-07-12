# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.9.3
pkgrel=2
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.9.3/fw')
sha256sums=('7217bd81d4a5121b352757ba7ca747592031feab138549a694d979883f53fe75')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

