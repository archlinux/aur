# Maintainer: Brocode <bros at brocode dot sh>

pkgname=goat
pkgver=0.8.0
pkgrel=1
pkgdesc="better sleep"
arch=('x86_64')
url="https://github.com/brocode/goat"
license=('WTFPL')
source=('https://github.com/brocode/goat/releases/download/0.8.0/goat')
sha256sums=('5182d860b61e59f1eaf391d9b1901cc62e222c38902494760fe7cfaf1f949481')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x goat
  cp goat "${pkgdir}/usr/bin/goat"
}

