# Maintainer: Pierre-Gildas MILLON <pgmillon@gmail.com>

pkgname=python2-universal-analytics-python
pkgver=0.2.4
pkgrel=1
pkgdesc="Universal Analytics Python Module"
arch=('any')
url="https://pypi.python.org/pypi/universal-analytics-python/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/u/universal-analytics-python/universal-analytics-python-$pkgver.tar.gz")
md5sums=('20982cc84a974ddfeb628fbba8284907')

build() {
  cd "${srcdir}/universal-analytics-python-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/universal-analytics-python-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
