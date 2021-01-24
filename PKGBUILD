# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=v4.3.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
arch=('x86_64')
url="https://github.com/Dundee/gdu"
conflicts=(gdu gdu-git)
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu_linux_amd64.tgz")
sha256sums=('8307754549f8b66d3f456880bb47fbb4ab61aa3b5e1c517c0b08e8fa39a61f14')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
}

