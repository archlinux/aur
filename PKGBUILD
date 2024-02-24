# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=docker-slim
pkgver=1.40.11
pkgrel=1
pkgdesc="Minify and Secure Docker containers"
arch=('x86_64')
url="https://github.com/docker-slim/docker-slim"
license=('apache')
depends=()
source=("${pkgver}.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
sha256sums=('5c83bfddbb130709a21dd6f4d02bb8d82b4347c0e9dce25a8eece98eb34763bc')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/dist_linux/* $pkgdir/usr/bin/
}
