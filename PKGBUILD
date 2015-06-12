pkgname=geben-on-emacs
pkgver=0.26
pkgrel=1
pkgdesc="interfaces Emacs to DBGp protocol with which you can debug running scripts interactively"
arch=(any)
url="http://code.google.com/p/geben-on-emacs/"
license=('GPL2')
depends=(emacs)
source=(http://geben-on-emacs.googlecode.com/files/geben-$pkgver.tar.gz)
md5sums=('521f06b7ef8da949e1897c8f70a39e66')

build() {
  cd "$srcdir/geben-$pkgver"
  make || return 1
  make SITELISP=$pkgdir/usr/share/emacs/site-lisp install
}
