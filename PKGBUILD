# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-geojson
pkgver=2.1.0
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python')
makedepends=('python-setuptools')

source=(python-geojson-$pkgver.tar.gz::https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz)

sha1sums=('47ea5bfcf096c70bac60f81e02f46741c440a4ce')

package() {
	cd python-geojson-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-geojson/LICENSE
}
