#Maintainer: Franz Müller <ethylisocyanat@gmail.com>

pkgname=('python-rasterio')
_pyname=rasterio
pkgver=1.0a5
pkgrel=1
pkgdesc='Python library for reading and writing geospatial raster data.'
url='https://github.com/mapbox/rasterio'
arch=('any')
license=('MIT')
depends=('gdal')
makedepends=('python-setuptools' 'cython')
source=('https://github.com/mapbox/rasterio/archive/1.0a5.tar.gz')
sha256sums=('17b18c4964979c1954439eedcb806b83d1bfd7e2cbe1f459c59680919fa581c2')

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}