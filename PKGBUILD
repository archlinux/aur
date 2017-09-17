pkgname=liboqapy-iproc
pkgver=0.2.0
pkgrel=1
pkgdesc='Image processing library for oqapy'
url="http://www.oqapy.eu/"
arch=(i686 x86_64)
license=('GPL')
provides=(oqapy-iproc)
depends=(opencv gcc-libs)
source=(https://launchpad.net/oqapy/trunk/oqapy/+download/$pkgname-$pkgver.tar.gz)
sha256sums=('fca66d6e57b5a5ac0dab972f858774f1cd072be7be4cef600fd07bb354455495')
build(){
  cd $srcdir/$pkgname-$pkgver
  sh ./build.sh
}
package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 liboqapy-iproc.so $pkgdir/usr/lib/liboqapy-iproc.so
}
