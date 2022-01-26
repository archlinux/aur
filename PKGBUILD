# Maintainer: monosans

pkgname=python-balaboba
_pkgname=balaboba
pkgver=1.0.5
pkgrel=1
pkgdesc='Wrapper for Yandex Balaboba'
url=https://github.com/monosans/balaboba
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-cloudscraper)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ae9fc8423ff2f741415f8ffe959918bba091e2b7bd7d61938c8ef32800497249')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
