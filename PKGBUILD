pkgname=python-conversionutil
pkgver=1.4.3
pkgrel=1
pkgdesc="A collection of conversion utilities"
url="https://bitbucket.org/davisowb/conversionutil"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=(python-timingsutil python-six python-logging-helper)
source=("https://pypi.io/packages/source/c/conversionutil/conversionutil-${pkgver}.tar.gz")
md5sums=('1e6085d01e7136ba09d585d537b4a154')


build() {
  cd "${srcdir}"/conversionutil-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/conversionutil-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


