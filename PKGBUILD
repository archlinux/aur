# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=apgl
pkgname=python-$_name
pkgver=0.8.1
pkgrel=2
pkgdesc='A simple, fast and easy to use Python graph library using NumPy, Scipy and PySparse'
arch=('any')
url='https://github.com/charanpald/APGL'
license=('LGPL')
depends=('python' 'python-numpy' 'python-scipy')
source=("https://pypi.python.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('9cc189a76d3a5558189ae9b38573ed4b')

package() {
	cd "$srcdir/apgl-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
