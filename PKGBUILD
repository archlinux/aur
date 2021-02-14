# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=4.6.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu gdu-git)
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu_linux_amd64.tgz")
sha256sums=('e105fff2071be1d4305ff2d5a5655f8580d9ac6c1364799e2c34d7fd0a8761d0')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
}

