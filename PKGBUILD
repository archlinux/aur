# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname="dclibzpoc"
pkgver="0.3.7"
pkgrel=1
pkgdesc="Libraries for the ZPoC Christian File Sharing program"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.zpoc.com.br/"
depends=('libxml2' 'bzip2' 'qt3')
source=(http://rullz.lv/zpoc/download/$pkgname-$pkgver-2.tar.bz2)
md5sums=('26ae9f295f58fe2686c0ab2085e51db5')

package() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

