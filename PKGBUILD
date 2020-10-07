# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.32.0
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('9a50886367a04718939a9801400a74af2f1f73b7a1a32023d556438b294aa67c')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
