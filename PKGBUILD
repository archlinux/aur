# Maintainer: monosans

pkgname=python-vkbottle-types
_pkgname=vkbottle-types
pkgver=5.131.134
pkgrel=1
pkgdesc='Types for vkbottle'
url=https://github.com/vkbottle/types
arch=(any)
license=(unknown)
makedepends=(python-setuptools)
depends=(python python-pydantic)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('96c8abe8a9785cfc4737b98492190105447fd6e430ccb41763b3266dc658de52')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
