# Maintainer:  Razer <razer@neuf.fr>

pkgname=python-pyserial-asyncio
_pypi_pkgname=pyserial-asyncio
pkgver=0.5
pkgrel=1
pkgdesc="Asyncio extension package for pyserial "
arch=(any)
url="https://github.com/pyserial/pyserial-asyncio"
license=('BSD')
depends=('python-pyserial')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('1641e5433a866eeaf6464b3ab88b741e7a89dd8cd0f851b3343b15f425138d33')

build() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

