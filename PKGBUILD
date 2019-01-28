# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.18.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.18.0/fw')
sha256sums=('23303bafc61b70091d7d42f3bb57d6293c6df877e02c1e288398215ade91c6fc')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

