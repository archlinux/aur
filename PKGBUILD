# Contributor: boteium
pkgname=fakeroute
pkgver=0.3
pkgrel=3
license=("unknown")
source=("http://www.thoughtcrime.org/software/fakeroute/${pkgname}-${pkgver}.tar.gz")
pkgdesc="a hack that makes your host appear (to unix traceroute) to be anywhere"
arch=('i686' 'x86_64')
url=http://www.thoughtcrime.org/software/fakeroute/
install="fakeroute.install"

md5sums=('d35c1894f2774993e785825f9fd06fa2')


build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
}
