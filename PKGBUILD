# Maintainer: monosans

pkgname=python-vkbottle-types
_pkgname=vkbottle-types
pkgver=5.131.131.12
pkgrel=4
pkgdesc='Types for vkbottle'
url=https://github.com/vkbottle/types
arch=(any)
license=(unknown)
makedepends=(python-setuptools)
depends=(python python-pydantic)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9bebc09bbbf167777bf7c60b0ddee817e5eb63c2d32636dbed2fbe738a1c21f6')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
