# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sunrise-commander
pkgver=6r459
pkgrel=1
pkgdesc="A two panel filemanager for emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/Sunrise_Commander"
license=('GPL')
depends=('emacs' 'avfs' 'fuse')
optdepends=('zip: support for zip files' 'unzip: support for zip files')
source=(http://www.emacswiki.org/emacs/download/sunrise-commander.el)
md5sums=('6c5fab0a8141a1fc00a89c8f40a35e77')

package() {
  cd $srcdir
  install -Dm644 $pkgname.el \
    $pkgdir/usr/share/emacs/site-lisp/$pkgname.el
}
