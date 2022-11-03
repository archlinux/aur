pkgname=python-otfmi
pkgver=0.15
pkgrel=1
pkgdesc="FMI models manipulation module"
license=('LGPL')
arch=('any')
url="http://www.openturns.org/"
depends=('openturns')
makedepends=('python-setuptools')
source=("https://github.com/openturns/otfmi/archive/v$pkgver.tar.gz")
sha256sums=('18f481a20d08aa0b6ad85b21a27d43a1b13242696568da7f81ed3304b3be0f6e')

build() {
  cd otfmi-$pkgver
  python setup.py build
}

package() {
  cd otfmi-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

