pkgname=python-geojson
pkgver=1.0.7
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python')
makedepends=('python-setuptools')

source=(https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz)
md5sums=('60f01b2c00bdb7e1eabee67dbb7cfd32')

package() {
	cd python-geojson-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/python-geojson/LICENSE"
}
