# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Maintainer: monosans

pkgname=python-vk_api
_pkgname=vk_api
pkgver=11.9.8
pkgrel=1
pkgdesc='vk.com API wrapper'
url=https://github.com/python273/vk_api
arch=(any)
license=(APACHE)
makedepends=(python-setuptools)
depends=(python python-requests)
optdepends=('python-websocket-client: vkstreaming'
			'python-beautifulsoup4: vkaudio')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('11c731e214ebc7fa911db81efb021f97587493a5402b992f24748fe1cd9d7afc')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
