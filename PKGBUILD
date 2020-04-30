# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=2.0.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/v2.0.0/fblog')
sha256sums=('2ab180ba8f3f90affab081d897d30dc999c4956160fa2140af7fb4cea6862ec4')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

