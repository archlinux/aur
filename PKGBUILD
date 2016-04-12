_name=typecheck-decorator
pkgname=python-$_name
pkgver=1.3
pkgrel=1
pkgdesc='Flexible explicit run-time type checking of function arguments'
arch=('any')
url="https://github.com/prechelt/$_name"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/t/$_name/$_name-$pkgver.zip")
md5sums=('17ec3c6fde07a5d0b44967f5642cf305')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
