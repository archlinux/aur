# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=v2.3.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
arch=('x86_64')
url="https://github.com/Dundee/gdu"
conflicts=(gdu gdu-git)
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu-linux-amd64.tgz")
sha256sums=('b231a65e00b12d15fdd51a18c703b8f0cd9cdde30c00441a04947cc104852c07')

package() {
  cd "$srcdir"
  install -Dm755 gdu-linux-amd64 "${pkgdir}"/usr/bin/gdu
}

