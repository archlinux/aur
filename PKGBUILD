# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.7.0
pkgrel=1
pkgdesc="faster workspace management"
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.7.0/fw')
sha256sums=('28ae5ef435d3fca2564123e857c1a638d1faa67950d1c48093b9baf96118e221')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp fw "${pkgdir}/usr/bin/fw"
}

