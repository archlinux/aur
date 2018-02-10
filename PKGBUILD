# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=1.0.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/1.0.0/fblog')
sha256sums=('729d86e2dca809a3053cda171990d18604fe86612aed91ac3b6c9910088738c1')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

