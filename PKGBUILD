pkgname=python2-libmsiecf
_pkgcode=libmsiecf
pkgver=20151220
pkgrel=1
pkgdesc="Library and tools to access the Microsoft Internet Explorer (MSIE) Cache File (index.dat) files"
url="https://github.com/libyal/libmsiecf/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=fd85fa5eb63c7a92386dc6d7877323db
source=(https://pypi.python.org/packages/source/l/$_pkgcode-python/$_pkgcode-python-$pkgver.tar.gz#md5=$md5sum)
md5sums=($md5sum)

build() {
  cd $srcdir/${_pkgcode}-${pkgver}

  python2 setup.py build
}

package() {
  cd $srcdir/${_pkgcode}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}
