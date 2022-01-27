# Maintainer: monosans

pkgname=python-balaboba
_pkgname=balaboba
pkgver=1.0.6
pkgrel=1
pkgdesc='Wrapper for Yandex Balaboba'
url=https://github.com/monosans/balaboba
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-cloudscraper)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6207627ea3cf79f22754124d8f1e8b3dcd6202d5529a0d62e9a5d9ead42b2329')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
