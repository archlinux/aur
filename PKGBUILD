# Contributor: Connor Behan <connor.behan@gmail.com>

pkgbase="python-vegas"
pkgname=("python-vegas" "python2-vegas")
pkgver=5.5
pkgrel=1
pkgdesc="Python library for multidimensional Monte Carlo integration"
arch=('i686' 'x86_64')
makedepends=('cython' 'cython2')
license=('LGPL')
url="https://github.com/gplepage/vegas.git"
source=(https://pypi.python.org/packages/source/v/vegas/vegas-${pkgver}.tar.gz)

package_python-vegas() {
	depends=("python-gvar")

	cd "$srcdir"/vegas-$pkgver
	python setup.py install --root="$pkgdir" --prefix=/usr
}

package_python2-vegas() {
	depends=("python2-gvar")

	cd "$srcdir"/vegas-$pkgver
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

md5sums=('f4d4414788fb84ebbcf7be6b7492bea0')
