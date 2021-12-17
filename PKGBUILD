# Maintainer: monosans

pkgname=python-pywttr-models
_pkgname=pywttr-models
pkgver=0.1.1
pkgrel=1
pkgdesc='Pydantic models for pywttr and aiopywttr'
url=https://github.com/monosans/pywttr-models
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-pydantic)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('14999a73403213638c4eb4582901a8ce8cc3bcce85935d3cd4113e38bbd6ec0f')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
