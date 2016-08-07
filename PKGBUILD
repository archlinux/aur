# Maintainer: tembleking <tembleking at gmail dot com>
pkgname='python2-googlemaps'
pkgver=2.4.3
pkgrel=1
pkgdesc="Python Client for Google Maps Services"
arch=("any")
url="https://github.com/googlemaps/google-maps-services-python"
license=('Apache')
depends=("python2")
makedepends=("python2-setuptools")
source=("https://github.com/googlemaps/google-maps-services-python/archive/$pkgver.tar.gz")

build() {
	cd "google-maps-services-python-$pkgver"
	python2 setup.py build
}

package() {
	cd "google-maps-services-python-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('4a258d5bb240d31ac96a5d472fcd9b3d')
sha1sums=('86ed32c7bc067d5a838c20933680210dbe9e4bda')
sha256sums=('43d2720a636c1db929af9f838c8dc673c28148f9001604a810e379c57c6466a1')
sha512sums=('548a3a8868028f219378f0c0fafc52293bb139094a8c7646bd9cca7d5f391c79cd9e62f6cc6e295d123c66c1018b5334101f7e3412d8db9e636d4722e07577d2')
