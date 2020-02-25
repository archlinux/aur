# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=1.4.1
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/v1.4.1/fblog')
sha256sums=('1f6ae685e8451ebd35de8a65089f562a5e894bb48fbb9638687dbb4f3b179658')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

