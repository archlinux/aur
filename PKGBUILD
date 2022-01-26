# Maintainer: monosans

pkgname=python-aiopywttr
_pkgname=aiopywttr
pkgver=0.1.3
pkgrel=1
pkgdesc='Asynchronous wrapper for wttr.in weather forecast'
url=https://github.com/monosans/aiopywttr
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp python-pywttr-models)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('11a1f83e0ab7e83d0aae98fc1373a543d129e92329d2b721e3237cc7cbe705cf')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
