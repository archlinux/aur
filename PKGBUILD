# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-geojson
pkgver=1.2.1
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz")

sha1sums=('87c7a6b7d4fae0ccf4bcfb527ff29e8ba3a55083')

package() {
	cd python-geojson-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-geojson/LICENSE
}
