# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=v2.1.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
arch=('x86_64')
url="https://github.com/Dundee/gdu"
conflicts=(gdu gdu-git)
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu-linux-amd64.tgz")
sha256sums=('21030544e946ab4de26d4e67c39d348ff7ea8a7c387c9a5df1edd35797ff00ac')

package() {
  cd "$srcdir"
  install -Dm755 gdu-linux-amd64 "${pkgdir}"/usr/bin/gdu
}

