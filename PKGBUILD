# Maintainer: Riccardo Berto <riccardobrt at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname='python-googlemaps'
pkgver=2.5.1
pkgrel=1
pkgdesc="Python Client for Google Maps Services"
arch=("any")
url="https://github.com/googlemaps/google-maps-services-python"
license=('Apache')
depends=("python" "python-requests")
makedepends=("python-setuptools")
source=("https://github.com/googlemaps/google-maps-services-python/archive/$pkgver.tar.gz")
md5sums=('184fe061a1c4a8eb3adfab53c7ef5330')

build() {
	cd "google-maps-services-python-$pkgver"
	python setup.py build
}

package() {
	cd "google-maps-services-python-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
