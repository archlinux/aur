# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.26.1
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('1d87f22fa990fc97dab14171c9cc000ed88dd94864c436397442a79b843f7a25')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
