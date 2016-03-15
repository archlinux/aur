pkgname=python2-libesedb
_pkgcode=libesedb
pkgver=20151205
pkgrel=1
pkgdesc=" Library and tools to access the Extensible Storage Engine (ESE) Database File (EDB) format." 
url="https://github.com/libyal/libesedb/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=63c0a8f64dfb07fd6571633e7f34919f
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
