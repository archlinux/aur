pkgname=python2-libfwsi
_pkgcode=libfwsi
pkgver=20150822
pkgrel=1
pkgdesc="Library to access the Windows Shell Item format" 
url="https://github.com/libyal/libfwsi/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=78ee381b517d56c61c817a9e53576b89
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
