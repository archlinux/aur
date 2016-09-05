# Contributor: Connor Behan <connor.behan@gmail.com>

pkgbase="python-gvar"
pkgname=("python-gvar" "python2-gvar")
pkgver=7.2
pkgrel=1
pkgdesc="Python library for working with correlated Gaussian variables"
arch=('i686' 'x86_64')
makedepends=('cython' 'cython2')
license=('LGPL')
url="https://github.com/gplepage/gvar.git"
source=(http://pypi.python.org/packages/source/g/gvar/gvar-${pkgver}.tar.gz)

package_python-gvar() {
	depends=("python-numpy")

	cd "$srcdir"/gvar-$pkgver
	python setup.py install --root="$pkgdir" --prefix=/usr
}

package_python2-gvar() {
	depends=("python2-numpy")

	cd "$srcdir"/gvar-$pkgver
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

md5sums=('6092246e61f79081ac2fc96db84dd67b')
