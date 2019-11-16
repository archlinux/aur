# Maintainer:  Razer <razer@neuf.fr>

pkgname=python-pyserial-asyncio
_pypi_pkgname=pyserial-asyncio
pkgver=0.4
pkgrel=1
pkgdesc="Asyncio extension package for pyserial "
arch=(any)
url="https://github.com/pyserial/pyserial-asyncio"
license=('BSD')
depends=('python-pyserial')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('67244fdc11cc31cf0ebf675c271c71d8')

build() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

