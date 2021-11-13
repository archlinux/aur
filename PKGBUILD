# Maintainer: monosans

pkgname=python-pygismeteo
_pkgname=pygismeteo
pkgver=1.1.0
pkgrel=1
pkgdesc='Wrapper for Gismeteo.ru'
url=https://github.com/monosans/pygismeteo
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-lxml python-requests)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1c837c93119c9edc1b239fe50675944c06506ffd4fd464f4bf543540eba17db3')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
