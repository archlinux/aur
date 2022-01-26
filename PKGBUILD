# Maintainer: monosans

pkgname=python-aiobalaboba
_pkgname=aiobalaboba
pkgver=1.0.4
pkgrel=1
pkgdesc='Asynchronous wrapper for Yandex Balaboba'
url=https://github.com/monosans/aiobalaboba
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2b914b291e41f856dd8c5cf88a2434fd8dd6b222f4ec3adcf2f71ece71b77acc')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
