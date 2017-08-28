# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python-tbvaccine
_name=tbvaccine
pkgver=0.2.2
pkgrel=1
pkgdesc='Pretty-print Python tracebacks'
arch=(any)
url=''
license=(MIT)
depends=()
_wheel2="$_name-$pkgver-py2-none-any.whl"
_wheel3="$_name-$pkgver-py3-none-any.whl"
source=("$_wheel3::https://pypi.python.org/packages/ad/68/af2fdc13122bde84e81af1b306915bcacf6eafb7b1be0f4466615f6dfc74/$_wheel2")
md5sums=('8fa534864c71636ca516e3956803c14b')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel3"
}
