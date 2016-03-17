pkgname=python2-libscca
_pkgcode=libscca
pkgver=20151226
pkgrel=1
pkgdesc="Library and tools to access the Windows Prefetch File (SCCA) format" 
url="https://github.com/libyal/libscca/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=6257cb0c9af82320c2e8c3fcff88aec4
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
