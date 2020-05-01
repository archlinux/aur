# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=2.0.1
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/v2.0.1/fblog')
sha256sums=('f867d9646a422b2a0b8f81bdc5c6b06cbefa4d7f6ec164523abbd9a15062efa9')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

