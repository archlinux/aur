# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.19.1
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.19.1/fw')
sha256sums=('478421bd76e0da37fd19f036a59275a7b27ee27a2e7315fc756f0ba0b8e76fe4')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

