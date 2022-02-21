# Maintainer: monosans

pkgname=python-pywttr
_pkgname=pywttr
pkgver=1.0.0
pkgrel=1
pkgdesc='Wrapper for wttr.in weather forecast'
url=https://github.com/monosans/pywttr
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-pywttr-models python-requests)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6852bfb50d5a4d9d33d3bb7a023316359e0db4bc28261434bbd8073b300fdf2b')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
