# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=v1.4.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu-linux-amd64.tgz")
sha256sums=('893e909a3cf0a6a7bfe6ab8382a7c3c410b794ee56c72c28fd2efc822611010a')

package() {
  cd "$srcdir"
  install -Dm755 gdu-linux-amd64 "${pkgdir}"/usr/bin/$pkgname
}

