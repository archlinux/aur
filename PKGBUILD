# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=4.8.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu gdu-git)
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu_linux_amd64.tgz")
sha256sums=('c10c5b99e96c335d409e7f68a5ce0dd1a050eb783dc7a66955ae233bec277f1c')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
}

