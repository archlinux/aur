pkgname=python2-libolecf
_pkgcode=libolecf
pkgver=20160109
pkgrel=1
pkgdesc="Library and tools to access the OLE 2 Compound File (OLECF) format" 
url="https://github.com/libyal/libolecf/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=43f963b2fe4e3dd29158a14f55676c63
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
