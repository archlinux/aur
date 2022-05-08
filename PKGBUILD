# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.37.5
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("${pkgver}.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('dab611c00b7b8582e63d6822b5581d2e987b818c142252afcde22fa508777c58')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
