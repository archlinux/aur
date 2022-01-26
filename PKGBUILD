# Maintainer: monosans

pkgname=python-vkbottle-types
_pkgname=vkbottle-types
pkgver=5.131.133
pkgrel=1
pkgdesc='Types for vkbottle'
url=https://github.com/vkbottle/types
arch=(any)
license=(unknown)
makedepends=(python-setuptools)
depends=(python python-pydantic)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8701af252163385ad509058546db017436520b04087b41e6d25194cc7f13b0b0')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
