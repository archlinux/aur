# Maintainer: Philipp A. <flying-sheep@web.de>
_name=testpath
pkgname=python-$_name
pkgver=0.3
pkgrel=2
pkgdesc='Test utilities for code working with files and commands'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('MIT')
depends=('python')
makedepends=('python-pip')
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
md5sums=('8d73a01748dca501886c65ff442a61da')

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
