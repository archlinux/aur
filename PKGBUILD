# Contributor: zarra <zarraxx@gmail.com>
pkgname=py++
pkgver=1.0.0
pkgrel=2
pkgdesc="Py++ package and Boost.Python library provide a complete solution for interfacing Python and C++"
arch=('i686' 'x86_64')
url="http://www.language-binding.net/index.html"
license=('custom')
depends=('pygccxml')
options=(!strip)


source=(http://jaist.dl.sourceforge.net/sourceforge/pygccxml/pyplusplus-${pkgver}.zip)

md5sums=('4997f61fa27a432e36fa0142dc3dc06c')


build() {
  cd "$srcdir/Py++-${pkgver}"

  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg

}

# vim:set ts=2 sw=2 et:
