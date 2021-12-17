# Maintainer: monosans

pkgname=python-pywttr
_pkgname=pywttr
pkgver=0.1.1
pkgrel=1
pkgdesc='Wrapper for wttr.in weather forecast'
url=https://github.com/monosans/pywttr
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-pywttr-models python-requests)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f9ec58d74b2ade21c0bd1963243a1deb7541287e7ab8a12bb022041151c49626')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
