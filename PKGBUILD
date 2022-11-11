# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.39.0
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("${pkgver}.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('2ed693b58f04554081f3cf9c535108dd2ac5e8070c295e693e4a0dd39aee3570')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
