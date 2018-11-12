# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=1.2.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/1.2.0/fblog')
sha256sums=('a55d380133ca0520ca84fdcb0cce96e168e74536d73aac43bf7fe9d1ca802e5d')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

