# Maintainer: Mick Elliot <micke at sfu dot ca>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=exonerate
pkgver=2.2.0
origver=2.2.0
pkgrel=1
pkgdesc="A general purpose tool for biological sequence comparison"
arch=('i686' 'x86_64')
url="http://www.ebi.ac.uk/~guy/exonerate"
license=('GPL3')
depends=('glib2' 'pkgconfig')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('ad3f7fc413376201c4631687b2e0ae89')
makedepends=('gcc')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=$startdir/pkg/usr
  make 
  make install
}
