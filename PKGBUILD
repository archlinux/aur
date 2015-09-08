# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-parsedatetime
_pkgname=parsedatetime
pkgver=1.5
pkgrel=1
pkgdesc="Parse human-readable date/time strings."
arch=('any')
url='http://github.com/bear/parsedatetime'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sum=('09bfcd8f3c239c75e77b3ff05d782ab2c1aed0892f250ce2adf948d4308fe9dc')

build() {
  cd "${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}
md5sums=('e72720f9cd638bb9bbb3b616bc2508d4')
