pkgname=python-otfmi
pkgver=0.16.3
pkgrel=1
pkgdesc="FMI models manipulation module"
license=('LGPL')
arch=('any')
url="http://www.openturns.org/"
depends=('openturns')
makedepends=('python-setuptools')
source=("https://github.com/openturns/otfmi/archive/v$pkgver.tar.gz")
sha256sums=('e879f92e59665d01662af45ef0124ae1cbdc8403904a020c3d5c6b146227950a')

build() {
  cd otfmi-$pkgver
  python setup.py build
}

package() {
  cd otfmi-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

