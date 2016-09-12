# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=ndjson_testrunner
pkgname=python-ndjson-testrunner
pkgver=1.0.0
pkgrel=1
pkgdesc='A python unittest test runner that outputs newline delimited JSON results'
arch=('any')
url="https://github.com/flying-sheep/ndjson-testrunner"
license=('GPL3')
depends=('python')
makedepends=('python-pip')
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")  # wtf?
noextract=("$_wheel")
md5sums=('93905c1463c629f800168d4ebeaa0e82')

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
