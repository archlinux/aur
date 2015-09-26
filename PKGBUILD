pkgname=python-gdal
pkgver=2.0.0
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/source/G/GDAL/GDAL-${pkgver}.tar.gz")
md5sums=('03684d7aa3ef4527151c647b2330f0ac')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
