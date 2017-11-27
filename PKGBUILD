# Maintainer: Philipp A. <flying-sheep@web.de>
_name=qtico
pkgname=python-$_name
pkgver=0.1
pkgrel=1
pkgdesc='Tools for using cross-platform Qt icon themes'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=('GPL3')
depends=(python python-pyqt5)
makedepends=('python-pip')
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('e7215d78383ac34c0d927dcc240edb9203ef93d915d39bf8f70859f6be03d19d')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
