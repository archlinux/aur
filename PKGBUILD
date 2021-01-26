# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=v4.3.1
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
arch=('x86_64')
url="https://github.com/Dundee/gdu"
conflicts=(gdu gdu-git)
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/${pkgver}/gdu_linux_amd64.tgz")
sha256sums=('3bcc600249b0edc45ab87cb965560a3a433a4432be089581c0ae62a97344d132')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
}

