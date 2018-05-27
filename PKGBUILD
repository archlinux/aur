# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-geojson
pkgver=2.4.0
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python')
makedepends=('python-setuptools')

source=(python-geojson-$pkgver.tar.gz::https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz)

sha1sums=('8983d37ef9cd26d725a051c1d54093f158d97e80')

package() {
	cd python-geojson-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-geojson/LICENSE
}
