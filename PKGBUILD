# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.3.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.3.0/fw')
sha256sums=('cde2936f75d0b2f9291630738fa4b1cd26701804c6210608d4a15692862d8d43')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

