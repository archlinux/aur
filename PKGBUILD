pkgname=python-conversionutil
pkgver=1.1.0
pkgrel=1
pkgdesc="A collection of conversion utilities"
url="https://bitbucket.org/davisowb/conversionutil"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=(python-timingsutil python-six python-logging-helper)
source=("https://pypi.io/packages/source/c/conversionutil/conversionutil-${pkgver}.tar.gz")
md5sums=('84f3ef553e04c92014398f99f0e1f9a7')

prepare() {
  cd "${srcdir}"/conversionutil-$pkgver
}

build() {
  cd "${srcdir}"/conversionutil-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/conversionutil-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


