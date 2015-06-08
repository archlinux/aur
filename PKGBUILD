# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=python2-faulthandler
pkgver=2.4
pkgrel=1
pkgdesc="Display the Python traceback on a crash"
arch=('any')
url="https://pypi.python.org/pypi/faulthandler/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/f/faulthandler/faulthandler-$pkgver.tar.gz")
md5sums=('110960933b0902334e8804eb4ea20750')

build() {
  cd "${srcdir}/faulthandler-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/faulthandler-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
