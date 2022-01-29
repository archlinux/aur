# Maintainer: monosans

pkgname=python-vbml
_pkgname=vbml
pkgver=1.1.post1
pkgrel=1
pkgdesc='Sofisticated object oriented regex-based text parser'
url=https://github.com/tesseradecade/vbml
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-typing_extensions)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('59e852b35b2c4d3f8e7d927ab2e0a9dde753f3427ab9a61aca7ed2f4d3986f3c')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
