# Maintainer: monosans

pkgname=python-vbml
_pkgname=vbml
pkgver=1.1
pkgrel=1
pkgdesc='Sofisticated object oriented regex-based text parser'
url=https://github.com/tesseradecade/vbml
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-typing_extensions)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6926402c79793147daf70ce2c866b086f482eaf6e54369f17d3754b4b414d2f5')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=4 sw=4 noet:
