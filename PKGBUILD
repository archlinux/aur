# Maintainer: monosans

pkgname=python-pygismeteo
_pkgname=pygismeteo
pkgver=3.0.0
pkgrel=1
pkgdesc='Wrapper for Gismeteo.ru API'
url=https://github.com/monosans/pygismeteo
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-pygismeteo-base python-requests)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('86f62ef96d311c390fea294097e0b5bcbd823263070eb30274aed853804d061e')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
