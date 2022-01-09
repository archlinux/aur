# Maintainer: monosans

pkgname=python-choicelib
_pkgname=choicelib
pkgver=0.1.4
pkgrel=1
pkgdesc='Choose the best library with a similar interface from the given list'
url=https://github.com/vkbottle/choicelib
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fef2ed7252db1a49d3e75170f37ad0af1d76dc5bf7a748e16ebe141d463998fb')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
