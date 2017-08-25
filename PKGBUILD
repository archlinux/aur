# Maintainer: Riccardo Berto <riccardobrt at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname='python-alpha-vantage'
_pkgname='alpha_vantage'
pkgver=1.2.0
pkgrel=1
pkgdesc="Python Client for Google Maps Services"
arch=("any")
url="https://github.com/RomelTorres/alpha_vantage"
license=('MIT')
depends=("python" "python-requests" "python-simplejson" "python-pandas")
makedepends=("python-setuptools")
source=("https://github.com/RomelTorres/alpha_vantage/archive/$pkgver.tar.gz")
md5sums=('af8162d2a59dcdb95b16b75e20417584')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
