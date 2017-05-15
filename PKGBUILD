# Maintainer: Philipp A. <flying-sheep@web.de>
_pypiname=pyRserve
pkgname=python-rserve
pkgver=0.9.0
pkgrel=1
pkgdesc='Python client to remotely access the R statistic package via network'
arch=('any')
url="http://pypi.python.org/pypi/$_pypiname"
license=('MIT')
depends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
md5sums=('f222b12086beb9e08237dd411d592231')

package() {
	cd "$srcdir/$_pypiname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
