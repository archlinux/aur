# Maintainer: Mike Sampson <mike@sambodata.com>
# Contributor: Michal Soltys <soltys@ziu.info>

pkgname=nuttcp
pkgver=7.3.3
pkgrel=1
pkgdesc="TCP/UDP network testing tool - simple, easy to use, with interesting feature set."
arch=(i686 x86_64)
url="http://www.lcp.nrl.navy.mil/nuttcp/"
license=('GPL')
depends=('glibc')
install=nuttcp.install
source=(http://nuttcp.net/nuttcp/nuttcp-${pkgver}/nuttcp.c)
sha256sum=('dfbff3c38fb0cbdc474ca6d13539d425')
md5sums=('dfbff3c38fb0cbdc474ca6d13539d425')

build() {
  cd $srcdir
  cc nuttcp.c -o nuttcp
}

package() {
  install -D -m0755 -o0 -g0 nuttcp $pkgdir/usr/bin/nuttcp
}
