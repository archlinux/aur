# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.29.0
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('1cfac49da7a4f4ec257c7230f12afc44996f41bdeb7a4e994ffea1e6d7e56210')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
