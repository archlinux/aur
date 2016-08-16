# Maintainer: Jose Riha <jose1711 gmail com>
#
pkgname=python2-forgethtml
_pkgname=forgethtml
pkgver=2004_10_21
pkgrel=1
pkgdesc="Python module for writing HTML by building a tree from different classes"
arch=('i686' 'x86_64')
url="http://sqweek.net/code/9mount/"
license=('LGPL')
depends=('')
source=("http://forgethtml.sourceforge.net/forgethtml-cvs-2004-10-21.tar.gz")
md5sums=('b8b8a323c7a4364aa4058d5e5c8aaa4d')

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
