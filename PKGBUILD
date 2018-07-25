# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=random2
pkgname=python-$_pipname
pkgver=1.0.1
pkgrel=2
pkgdesc="Python 3 compatible port of Python 2 random module"
arch=(any)
url="https://pypi.org/project/random2/"
license=(PSF)
depends=(python)
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.zip")
sha256sums=('34ad30aac341039872401595df9ab2c9dc36d0b7c077db1cea9ade430ed1c007')

package() {
  cd $_pipname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
