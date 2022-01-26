# Maintainer: monosans

pkgname=python-aiopygismeteo
_pkgname=aiopygismeteo
pkgver=4.0.0
pkgrel=1
pkgdesc='Asynchronous wrapper for Gismeteo.ru API'
url=https://github.com/monosans/aiopygismeteo
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp python-pygismeteo-base)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('aa702133170feb2d1bd5ea94d1997de88f46be9d0330360c4ff4ad0bb80f3c38')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
