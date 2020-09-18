# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=2.3.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/v2.3.0/fblog')
sha256sums=('4a6e292b5843fc3f0c08e452249e05a53d3936aac62c85101f377a536e73dd15')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

