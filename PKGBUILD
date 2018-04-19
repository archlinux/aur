# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.9.2
pkgrel=2
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.9.2/fw')
sha256sums=('e79b9ed0ed278b4fef07c3a1dee1f41840301192378e5b4106a79d8922789b5f')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

