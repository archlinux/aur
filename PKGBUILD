# Maintainer: monosans

pkgname=python-balaboba
_pkgname=balaboba
pkgver=1.0.9
pkgrel=1
pkgdesc='Wrapper for Yandex Balaboba'
url=https://github.com/monosans/balaboba
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-cloudscraper)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('02bc1be1caa751790d367ae65eab4d82629688984d9a641b3d9191f95e84f519')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
