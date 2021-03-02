# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.34.0
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('bf5a391f75ee01b7b365084d658d6327e6529e5737036a4aa81bf25e3d8cff5b')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
