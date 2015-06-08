# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ilisp  
pkgver=20021222
pkgrel=1
pkgdesc="(X)Emacs interface for an inferior Common Lisp, or other Lisp based languages"
url="http://sourceforge.net/projects/ilisp/?source=directory"
arch=('any')
license=('GPL')
makedepends=('tcsh')
conflicts=()
replaces=()
backup=()
install=
source=(http://netcologne.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgname-snapshot/$pkgname-$pkgver.tar.gz)
md5sums=('e7a467c9e587640a81c66e53e367b914')

build() {
  cd $srcdir/$pkgname-$pkgver
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
