pkgname=python-gdal
pkgver=2.2.0
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://files.pythonhosted.org/packages/40/f9/8ad67763925b5c4f70a278ed725dc80dc774a4d30daf372a570a2faa9a8d/GDAL-2.2.0.tar.gz")
md5sums=('56dac195bcaaeffc1248e3f96cfb4e5a')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
