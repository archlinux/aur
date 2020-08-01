# Maintainer: Philipp A. <flying-sheep@web.de>

_name=genson
pkgname=python-$_name
pkgver=1.2.1
pkgrel=1
pkgdesc='GenSON is a powerful, user-friendly JSON Schema generator.'
arch=(any)
url="https://github.com/wolverdude/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('40b8faa17f53240f224d683d7a302b5f7b35eb7ab2aba1c223a58a38b8d09c42')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
