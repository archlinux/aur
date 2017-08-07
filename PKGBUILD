pkgname=python-gdal
pkgver=2.2.1
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/f2/c3/1cadfcae9a4330c3a68c41e3bc96a5d228883eec6ea3e2fc6321165b863c/GDAL-2.2.1.tar.gz")
sha256sums=('a12860507f12ef950409f5ebdb5f2db879c17f2ec0779c4760440d562b7cc275')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
