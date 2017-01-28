pkgname=python-gdal
pkgver=2.1.3
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/36/d7/f89ac1347185db56939c156330efbfa2e3be560060b74e31f41e514ee627/GDAL-2.1.3.tar.gz")
md5sums=('519bff3c56b8af5dbf388f93947b1281')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
