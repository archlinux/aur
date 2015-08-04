# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=schedule
pkgname=python-schedule
pkgver=0.3.2
pkgrel=1
pkgdesc='Python job scheduling for humans.'
arch=('any')
url="https://github.com/dbader/$_name"
license=('MIT')
depends=('python>=2.3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
md5sums=('e0ce768dee1e961ad5a02bf459334abc')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
