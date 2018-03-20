# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>
# Maintainer Stefan Husmann < stefan-husmann@t-online.de>
pkgname=emacs-elscreen-dnd
pkgver=0.0.0
pkgrel=2
pkgdesc="Frame configuration management for GNU Emacs modelled after GNU Screen"
arch=('any')
url="http://www.morishima.net/~naoto/software/elscreen/index.php.en"
license=('GPL')
depends=('emacs-elscreen')
makedepends=('emacs-apel')
source=(ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/${pkgname#emacs-}-$pkgver.tar.gz
)
md5sums=('fdf3d0063b9e324b3d8b40406daec246')

package () {
  cd $srcdir/${pkgname#emacs-}-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  cp ${pkgname#emacs-}.el "$pkgdir"/usr/share/emacs/site-lisp
}
