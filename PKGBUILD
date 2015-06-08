# Contributor: Jan Kròávek <wamba@centrum.cz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-newlisp
pkgver=0.25
pkgrel=6
arch=('any')
pkgdesc="Emacs mode for Newlisp."
url="http://artfulcode.net/projects"
depends=('emacs')
makedepends=('unzip')
license=('GPL')
source=($pkgname-$pkgver.zip::http://www.artfulcode.net/wp-content/uploads/2008/12/newlisp-mode.zip)
md5sums=('f752b6440cc4c8d6c1cea338ec923403')
noextract=newlisp-mode.zip
install=emacs-newlisp.install

package() {
  cd $srcdir/newlisp-mode
  install -d $pkgdir/usr/share/emacs/site-lisp/newlisp-mode
  install -Dm644 *.el $pkgdir/usr/share/emacs/site-lisp/newlisp-mode
}
