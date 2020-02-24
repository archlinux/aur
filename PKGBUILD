# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=v1.4.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/v1.4.0/fblog')
sha256sums=('2298d87c662b2b245099b0141066b3b4bc71fd21f676c15ce7316876d95e2e11')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

