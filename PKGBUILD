# Maintainer: monosans

pkgname=python-aiopywttr
_pkgname=aiopywttr
pkgver=0.1.2
pkgrel=1
pkgdesc='Asynchronous wrapper for wttr.in weather forecast'
url=https://github.com/monosans/aiopywttr
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp python-pywttr-models)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('96622dbac569989c95a1e1be40f04b6523db5ae68d228e9689578e84038343cb')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
