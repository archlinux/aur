# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.13.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.13.0/fw')
sha256sums=('ef504f22478ee5ab74da2e6e31b2423db33a3420f60f65520e90693d8abf2d4b')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

