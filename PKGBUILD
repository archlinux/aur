# Maintainer: alexandru.ianu@gmail.com


pkgname=cudaminer-cuda55
pkgver=20131218
_pkgver=2013-12-18
pkgrel=4
pkgdesc="CUDA accelerated mining application for scrypt coins. Stable 2013-12-18 build (introduction of CUDA 5.5 toolkit)."
url="https://bitcointalk.org/index.php?topic=167229.0"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cuda5.5' 'curl' 'jansson')
#optdepends=('')
makedepends=('tar')
conflicts=('cudaminer')
provides=('cudaminer')
source=(https://www.dropbox.com/s/nrwz51tiu1xsoz6/cudaminer-git-built-${_pkgver}.tar.xz)
sha256sums=('1675fdd531d70a2695319a68427a9e280e4ca27d097165e68de05fc811727814')
backup=(etc/cudaminer.conf)

package() {
  cp -a "$srcdir/usr" "$pkgdir"
  cp -a "$srcdir/etc" "$pkgdir"
}
