# Maintainer: monosans

pkgname=python-aiopygismeteo
_pkgname=aiopygismeteo
pkgver=3.0.0
pkgrel=1
pkgdesc='Asynchronous wrapper for Gismeteo.ru API'
url=https://github.com/monosans/aiopygismeteo
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp python-pygismeteo-base)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dcb2a3b9b85afdf021f44bf1985ab7d1a7a9b7e9890211098465d7cd793ebe0e')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
