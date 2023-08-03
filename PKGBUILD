# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.40.3
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("${pkgver}.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('97fe422d65a3df56d5105f05ef7f781e64bf4ebb1694bb0cfb75c56473db23d1')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
