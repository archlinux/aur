# Maintainer: monosans

pkgname=python-aiopywttr
_pkgname=aiopywttr
pkgver=1.0.0
pkgrel=1
pkgdesc='Asynchronous wrapper for wttr.in weather forecast'
url=https://github.com/monosans/aiopywttr
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp python-pywttr-models)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0b7acdcaedcfe51f73231d8f8a45405d182c2f32745d43da20b21acdd8d00d68')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
