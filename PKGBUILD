pkgname=python2-libsmdev
_pkgcode=libsmdev
pkgver=20160111
pkgrel=1
pkgdesc="Library to access to storage media devices" 
url="https://github.com/libyal/libsmdev/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=fac8ccfd1a1172d0cb68a8b2e765ee73
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
