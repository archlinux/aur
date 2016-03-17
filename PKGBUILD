# Maintainer: bluemeda <affif[dot]bluemeda[at]gmail[dot]com>
_name=schedule
pkgname=python2-schedule
pkgver=0.3.2
pkgrel=1
pkgdesc='Python job scheduling for humans.'
arch=('any')
url="https://github.com/dbader/$_name"
license=('MIT')
depends=('python>=2.3')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
md5sums=('e0ce768dee1e961ad5a02bf459334abc')

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}
