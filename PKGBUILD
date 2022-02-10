# Maintainer: monosans

pkgname=python-aiobalaboba
_pkgname=aiobalaboba
pkgver=1.0.6
pkgrel=1
pkgdesc='Asynchronous wrapper for Yandex Balaboba'
url=https://github.com/monosans/aiobalaboba
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4d32eafde32b6ee58a2578c3d3c30d1c655626690ea545ab4c5d05da492295c2')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
