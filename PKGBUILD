# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=enum34
pkgname=python-enum34
pkgver=0.9.21
pkgrel=1
pkgdesc='Python 3.4 Enum backported'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('BSD')
depends=('python<3.4')
source=("https://pypi.python.org/packages/source/e/$_name/$_name-$pkgver.tar.gz")
md5sums=('fc69a925910ed15efa405d0ae11baa29')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
