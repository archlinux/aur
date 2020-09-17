# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=2.2.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/v2.2.0/fblog')
sha256sums=('84cb51f2f7030569d1ba1a0dff7eb032591d3027dfaf9faba302cb277047a4d8')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

