# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-geojson
pkgver=1.2.0
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz")

sha1sums=('6fd94cc40b57cc56b00caf30c1a1bb0414cb9cb3')

package() {
	cd python-geojson-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-geojson/LICENSE
}
