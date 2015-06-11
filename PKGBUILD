# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=emacs-find-recursive
pkgver=20010326
pkgrel=2
pkgdesc="Emacs extension that lets you find files recursively in a directory"
arch=('any')
url="http://www.webweavertech.com/ovidiu/emacs/"
license=('GPL2')
depends=('emacs')
source=(http://www.webweavertech.com/ovidiu/emacs/find-recursive.txt)
md5sums=('468fcc4848e4adf54af4fdbe78581b95')

package ()
{
  cd $startdir/src/
  install -Dm644 $startdir/src/find-recursive.txt $startdir/pkg/usr/share/emacs/site-lisp/find-recursive.el
}
