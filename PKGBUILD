# Maintainer: Philipp A. <flying-sheep@web.de>

_name=genson
pkgname=python-$_name
pkgver=1.2.2
pkgrel=1
pkgdesc='GenSON is a powerful, user-friendly JSON Schema generator.'
arch=(any)
url="https://github.com/wolverdude/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('8caf69aa10af7aee0e1a1351d1d06801f4696e005f06cedef438635384346a16')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
