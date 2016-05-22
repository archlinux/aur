pkgname=python-gdal
pkgver=2.1.0
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/d1/98/27fff31ad298f3ec50db19dc3adfd8387279e158b1c6331c531c5fc7d830/GDAL-${pkgver}.tar.gz")
md5sums=('64084a5f114b4dffc53280e28d2ba4f3')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
