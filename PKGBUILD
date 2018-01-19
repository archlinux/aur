# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=0.3.4
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/0.3.4/fblog')
sha256sums=('65d54c732ad486ccbc81baa1a2ceffac42c616d71fd935e38ce3e4440c0c7a23')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

