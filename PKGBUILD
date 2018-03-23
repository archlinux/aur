# Maintainer: Brocode <bros at brocode dot sh>

pkgname=goat
pkgver=0.7.0
pkgrel=1
pkgdesc="better sleep"
arch=('x86_64')
url="https://github.com/brocode/goat"
license=('WTFPL')
source=('https://github.com/brocode/goat/releases/download/0.7.0/goat')
sha256sums=('575820ca9e5ff70d93e723f8db252d313559f65dd1c981b0c346feede280c54b')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x goat
  cp goat "${pkgdir}/usr/bin/goat"
}

