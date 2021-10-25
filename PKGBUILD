# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Maintainer: monosans

pkgname=python-vk_api
_pkgname=vk_api
pkgver=11.9.4
pkgrel=1
pkgdesc='vk.com API wrapper'
url=https://github.com/python273/vk_api
arch=(any)
license=(APACHE)
makedepends=(python-setuptools)
depends=(python python-requests python-beautifulsoup4 python-websocket-client python-six)
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('96256561d08f28ea5a9d32a7956e9c702a0e96240843a63a7a4cf5f745411d8a')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=4 sw=4 noet:
