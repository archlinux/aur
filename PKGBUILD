pkgname=python-gdal
pkgver=2.2.2
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/11/cd/edef955a6ef6cb4f2113647d7465b34663e074451b66919e734466ba5197/GDAL-2.2.2.tar.gz")
sha256sums=('ca9bc2b77e370153230d4640f8e000f51c2a468fdf8bfad4cf21410e3a1b2b45')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
