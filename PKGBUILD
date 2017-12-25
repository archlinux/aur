# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-sercol'
pkgver=0.1.0
pkgrel=1
pkgdesc="Rich collection class with grouping and filtering helpers in Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/sercol"
license=('Apache2.0')
depends=('python' 'python-pandas' 'python-serializable' 'python-simplejson')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/ca/6a/2e99f1b7e37f3506bfa50894ad934249d1e2c6a97e6d01d49a2fc02fd805/sercol-0.1.0.tar.gz")
md5sums=('c4c793c5b0933aa0120ee24196837b97')

package() {
  cd "${srcdir}/sercol-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
