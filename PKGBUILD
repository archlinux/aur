# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Maintainer: monosans

pkgname=python-vk_api
_pkgname=vk_api
pkgver=11.9.3
pkgrel=1
pkgdesc="Module for creating scripts for vk.com (vkontakte)"
url=https://github.com/python273/vk_api
arch=(any)
license=(APACHE)
depends=(python python-requests python-beautifulsoup4 python-websocket-client python-six)
makedepends=(python-setuptools)
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('bb2c20ac69f59a9e49bf9bbe5f3a59588ad9b155a56d68c83f3327ee63fe6967')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=4 sw=4 noet:
