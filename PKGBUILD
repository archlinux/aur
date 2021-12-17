# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Maintainer: monosans

pkgname=python-vk_api
_pkgname=vk_api
pkgver=11.9.7
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
sha256sums=('e88f69f4df4378995a43d00283c8c80a7d4c2f36aecacae1ff1e9fe4562f9e0d')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
