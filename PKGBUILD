# Maintainer: Pierre-Gildas MILLON <pgmillon@gmail.com> 

pkgname=python2-xattr
pkgver=0.8.0
pkgrel=1
pkgdesc="Python wrapper for extended filesystem attributes"
arch=('any')
url="https://pypi.python.org/pypi/xattr/"
license=(' MIT License')
depends=('python2' 'python2-cffi>=0.4')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/x/xattr/xattr-$pkgver.tar.gz")
md5sums=('23e62facf421f13a555ed47fead58052')

build() {
  cd "${srcdir}/xattr-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/xattr-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
