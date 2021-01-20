# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=v4.2.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
arch=('x86_64')
url="https://github.com/Dundee/gdu"
conflicts=(gdu gdu-git)
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu_linux_amd64.tgz")
sha256sums=('394ff742227a9438760c92e9c55d7d1092f59fe3ac4077b3bfbdae8939524737')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
}

