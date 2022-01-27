# Maintainer: monosans

pkgname=python-balaboba
_pkgname=balaboba
pkgver=1.0.8
pkgrel=1
pkgdesc='Wrapper for Yandex Balaboba'
url=https://github.com/monosans/balaboba
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-cloudscraper)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e27b39dcb58fdaae22e3569a6c1528f4f3dd87b6ad1eb28a7e5d28218640ecab')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
