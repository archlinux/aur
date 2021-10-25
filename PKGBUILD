# Maintainer: monosans

pkgname=python-minifier
_pkgname=python_minifier
pkgver=2.5.0
pkgrel=1
pkgdesc="Transform Python source code into it's most compact representation"
url=https://github.com/dflook/python-minifier
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python)
source=("https://pypi.io/packages/source/p/${pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('81397b9ec5bf1690e76b358c45af4ba6fa01be2739b478d4c1362b1fcdcf790b')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
