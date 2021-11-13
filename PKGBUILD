# Maintainer: monosans

pkgname=python-aiopygismeteo
_pkgname=aiopygismeteo
pkgver=1.1.0
pkgrel=1
pkgdesc='Asynchronous wrapper for Gismeteo.ru'
url=https://github.com/monosans/aiopygismeteo
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-lxml python-aiohttp)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b05de5cfd348e72be5286929c7e0b17cfa554e7473d548d50d2c10d75ae437a1')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
