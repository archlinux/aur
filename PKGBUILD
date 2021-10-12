# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.37.0
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('dfe3a833699e645eac0116fc42d609928bdb84bbc1859afa11a87700a8b03598')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
