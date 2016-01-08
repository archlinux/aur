# Maintainer: Tobias Roettger <toroettg@gmail.com>

pkgname=seriesmarker
_pkgname=SeriesMarker
pkgver=0.1.0
pkgrel=1
pkgdesc='A TV series browser and tracker application.'
arch=(any)
url="https://toroettg.github.io/SeriesMarker/"
license=('GPL3')
depends=('python' 'python-pytvdbapi' 'python-pyside' 'python-appdirs' 'python-sqlalchemy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/S/SeriesMarker/SeriesMarker-$pkgver.tar.gz)
md5sums=('229f96724ea2540bcab611c609a05698')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
