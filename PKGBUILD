# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=v2.2.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
arch=('x86_64')
url="https://github.com/Dundee/gdu"
conflicts=(gdu gdu-git)
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu-linux-amd64.tgz")
sha256sums=('b9f01e7456679673565234dc076c0ee522091435ad0a23cf3a0ad23624897b21')

package() {
  cd "$srcdir"
  install -Dm755 gdu-linux-amd64 "${pkgdir}"/usr/bin/gdu
}

