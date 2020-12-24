# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=v1.6.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
arch=('x86_64')
url="https://github.com/Dundee/gdu"
conflicts=(gdu gdu-git)
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu-linux-amd64.tgz")
sha256sums=('24bed8bea38ff6874bc45436f5d7ab7f504b25318ba0da4a48cfeeb4195b6cfc')

package() {
  cd "$srcdir"
  install -Dm755 gdu-linux-amd64 "${pkgdir}"/usr/bin/gdu
}

