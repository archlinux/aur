# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname="valknutzpoc"
pkgver="0.3.7"
pkgrel=1
pkgdesc="ZPoC Christian File Sharing program (Like DC++)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.zpoc.com.br/"
depends=('libxml2' 'bzip2' 'qt3' 'dclibzpoc')
source=(http://rullz.lv/zpoc/download/$pkgname-$pkgver-2.tar.bz2)
md5sums=('dcfc1246c20c7c5e80f65ff11d858fe5')

package() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

