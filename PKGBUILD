# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.40.0
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("${pkgver}.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('6351236186464c60e5ccbab42856d2101725ab4136f63fde79f7169977567f79')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
