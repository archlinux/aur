# Mantainer: M0Rf30

pkgname=drbl-experimental
_name=drbl
pkgver=2.8.12
pkgrel=1
pkgdesc="A software to manage the deployment of the GNU/Linux operating system across many clients."
arch=('i686' 'x86_64')
url="http://drbl.sourceforge.net/"
license=('GPL')
depends=('bash' 'bc')
provides=('drbl')
source=(http://free.nchc.org.tw/drbl-core/src/unstable/$_name-$pkgver.tar.bz2)

build() {
  cd $srcdir/$_name-$pkgver
  make  
}

package() {
  cd $srcdir/$_name-$pkgver
  make DESTDIR=$pkgdir install
}

md5sums=('fb9ccae51bc7db40b68c36110c56b69d')
