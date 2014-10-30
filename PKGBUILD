pkgname=python-geojson
pkgver=1.0.9
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz")

sha1sums=('ab717c085e3983f58b170a5e94816eb78bbc15c3')

package() {
	cd python-geojson-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-geojson/LICENSE
}
