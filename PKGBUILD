# Maintainer: Markus Gräb <m_graeb11@cs.uni-kl.de
# based on script by: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python2-geojson
pkgver=1.3.1
pkgrel=1

pkgdesc="Python bindings and utlities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')

depends=('python2')
makedepends=('python2-setuptools')

source=("https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz")

sha1sums=('8e51de90b0e860d7bfdc16143e66c3f2516e4c18')

package() {
	cd python-geojson-$pkgver
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python2-geojson/LICENSE
}
