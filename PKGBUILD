# Maintainer: Phil Schaf <flying-sheep@web.de>
_pypiname=pyRserve
pkgname=python-rserve
pkgver=0.8.1
pkgrel=1
pkgdesc='Python client to remotely access the R statistic package via network'
arch=('any')
url="http://pypi.python.org/pypi/$_pypiname"
license=('MIT')
depends=('python-numpy')
source=("http://pypi.python.org/packages/source/p/$_pypiname/$_pypiname-$pkgver.tar.gz")
md5sums=('70ec5fd74554e507b7848791c5b58d6e')

package() {
	cd "$srcdir/$_pypiname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
