pkgname=python-geojson
pkgver=1.1.0
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz")

sha1sums=('dbbc0770241f9eef870fcf3c2c7a45f47e6217b6')

package() {
	cd python-geojson-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-geojson/LICENSE
}
