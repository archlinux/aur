pkgname=python2-dfwinreg
_pkgcode=dfwinreg
pkgver=20160116
pkgrel=1
pkgdesc="Library and tools to access the Windows NT Registry File (REGF) format" 
url="https://github.com/log2timeline/dfwinreg/"
arch=('any')
license=('Apache')

makedepends=('libtool' 'python2')

md5sum=1049c0e7aff03425d434f730610990e7
source=(https://pypi.python.org/packages/source/d/$_pkgcode/$_pkgcode-$pkgver.tar.gz#md5=$md5sum)
md5sums=($md5sum)

build() {
  cd $srcdir/${_pkgcode}-${pkgver}

  python2 setup.py build
}

package() {
  cd $srcdir/${_pkgcode}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}
