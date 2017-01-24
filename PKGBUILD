# Maintainer: Mike Sampson <mike@sambodata.com>
# Contributor: Michal Soltys <soltys@ziu.info>

pkgname=nuttcp
pkgver=8.1.4
pkgrel=1
pkgdesc="TCP/UDP network testing tool - simple, easy to use, with interesting feature set."
arch=(i686 x86_64)
url="http://www.lcp.nrl.navy.mil/nuttcp/"
license=('GPL')
depends=('glibc')
install=nuttcp.install
source=(http://nuttcp.net/nuttcp/nuttcp-${pkgver}/nuttcp.c)
md5sums=('f3e236273f509f4f3993d9f842ffd860')

build() {
  cd $srcdir
  cc nuttcp.c -o nuttcp
}

package() {
  install -D -m0755 -o0 -g0 nuttcp $pkgdir/usr/bin/nuttcp
}
