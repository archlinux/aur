# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=2.1.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/v2.1.0/fblog')
sha256sums=('12f27c189b3787cfa1980b8823409acfd2dc20c5a54d624bf9ce677787150da5')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

