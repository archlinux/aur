# Maintainer: monosans

pkgname=python-choicelib
_pkgname=choicelib
pkgver=0.1.5
pkgrel=1
pkgdesc='Choose the best library with a similar interface from the given list'
url=https://github.com/vkbottle/choicelib
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('450035a260e5621af793ea858be1f7b04e38bb50c7c40f9ef480da3c571314c7')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
