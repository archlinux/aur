# Maintainer: monosans

pkgname=python-vkbottle-types
_pkgname=vkbottle-types
pkgver=5.131.134.1
pkgrel=1
pkgdesc='Types for vkbottle'
url=https://github.com/vkbottle/types
arch=(any)
license=(unknown)
makedepends=(python-setuptools)
depends=(python python-pydantic)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('855ee9c25608c47c75d3997908d90171a9eebdf62281d62b3702c78137c7bc95')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
