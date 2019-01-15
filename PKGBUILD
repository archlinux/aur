# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.17.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.17.0/fw')
sha256sums=('d708f75a0931cbbb277f64cbf8deba44b301fd594df358c3fde837ddd19cd18a')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

