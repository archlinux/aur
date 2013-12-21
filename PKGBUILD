# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=enum34
pkgname=python-enum34
pkgver=0.9.19
pkgrel=1
pkgdesc='Python 3.4 Enum backported'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('BSD')
depends=('python<3.4')
source=("https://pypi.python.org/packages/source/e/$_name/$_name-$pkgver.tar.gz")
md5sums=('efb6a497f51e480ed356e976d0369cb3')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}