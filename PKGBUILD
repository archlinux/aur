# Maintainer: monosans

pkgname=python-aiobalaboba
_pkgname=aiobalaboba
pkgver=1.0.5
pkgrel=1
pkgdesc='Asynchronous wrapper for Yandex Balaboba'
url=https://github.com/monosans/aiobalaboba
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-aiohttp)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bee9e8e05c3a17c77f5fce6c0caa4ff22cb4ca8521816e922a5d2e39e744c1fc')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
