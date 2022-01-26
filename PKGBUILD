# Maintainer: monosans

pkgname=python-pygismeteo
_pkgname=pygismeteo
pkgver=4.0.0
pkgrel=1
pkgdesc='Wrapper for Gismeteo.ru API'
url=https://github.com/monosans/pygismeteo
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-pygismeteo-base python-requests)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('12235d2e03ca7f76e07121e14e491cc8293686616600df0c788702d5cbc7fb63')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
