# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=shaperprobe
pkgver=12.1
pkgrel=4
pkgdesc="Detecting ISP Traffic Rate-Limiting"
arch=('i686' 'x86_64')
#url="http://www.cc.gatech.edu/grads/p/partha/diffprobe/shaperprobe.html"
url="https://code.google.com/p/shaperprobe/"
license=('GPL')
depends=()
source=(http://distcache.freebsd.org/ports-distfiles/${pkgname}.tgz)
md5sums=('d555ace1f2e8d86ce2975457b09b17b7')

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  install -m 755 prober ${pkgdir}/usr/bin/
}
