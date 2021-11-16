# Maintainer: monosans

pkgname=python-aiopygismeteo
_pkgname=aiopygismeteo
pkgver=2.0.0
pkgrel=1
pkgdesc='Asynchronous wrapper for Gismeteo.ru'
url=https://github.com/monosans/aiopygismeteo
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-lxml python-aiohttp)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('eaea298fa989b821796f837befaa79b2e809ea3f2b18ed3373e12fd9d0fa2440')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
