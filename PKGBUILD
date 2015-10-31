pkgname=python-gdal
pkgver=2.0.1
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/source/G/GDAL/GDAL-${pkgver}.tar.gz")
md5sums=('df013c4417a3820b6d59c9b01d2c68c9')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
