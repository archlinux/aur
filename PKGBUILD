# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=4.6.3
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu gdu-git)
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu_linux_amd64.tgz")
sha256sums=('e5fe9eb69103a158f610086fa61eaa8c497e3ccc43018078cfed778c5dff6de3')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
}

