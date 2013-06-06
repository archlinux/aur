# Contributor: zarra <zarraxx@gmail.com>
pkgname=pygccxml
pkgver=1.0.0
pkgrel=3
pkgdesc="The purpose of pygccxml is to read a generated file and provide a simple framework to navigate C++ declarations, using Python classes."
arch=('i686' 'x86_64')
url="http://www.language-binding.net/pygccxml/pygccxml.html"
license=('custom')
depends=('gccxml-cvs' 'python2')
options=(!strip)

source=(http://jaist.dl.sourceforge.net/sourceforge/pygccxml/pygccxml-${pkgver}.zip)

md5sums=('44badbf8c4bcd3095290a90f2f2a9234')


build() {
  cd "$srcdir/pygccxml-${pkgver}"

  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg

}

# vim:set ts=2 sw=2 et:
