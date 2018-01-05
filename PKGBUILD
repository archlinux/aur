# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.4.3
pkgrel=1
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-h5py python-pandas python-scipy)
makedepends=(python-pip)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('666b61fea65d8f4b75b78d444746a7b5f6c3a78346bd39f37b0d95e476e081b4')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
