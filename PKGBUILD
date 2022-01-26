# Maintainer: monosans

pkgname=python-pygismeteo-base
_pkgname=pygismeteo-base
pkgver=2.1.0
pkgrel=1
pkgdesc='Base for pygismeteo and aiopygismeteo'
url=https://github.com/monosans/pygismeteo-base
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-pydantic)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0ba618d155c3cb4c51adcdfc19f8d1c7cfb70c1211d817fe94814827302d7476')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
