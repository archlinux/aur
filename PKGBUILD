# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Maintainer: monosans

pkgname=python-vk_api
_pkgname=vk_api
pkgver=11.9.1
pkgrel=1
pkgdesc="Module for creating scripts for vk.com (vkontakte)"
url=https://github.com/python273/vk_api
arch=(any)
license=(APACHE)
depends=(python python-requests python-beautifulsoup4 python-websocket-client python-six)
makedepends=(python-setuptools)
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('a034052c44bea4d9de8d3e5723ca236b53b715caf0b7323b2ed7f0e1940f1c05')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=4 sw=4 noet:
