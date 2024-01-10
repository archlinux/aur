# Mantainer: Snaporaz
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgbase="python-gvar"
pkgname=("python-gvar" "python2-gvar")
pkgver=12.1
pkgrel=1
pkgdesc="Python library for working with correlated Gaussian variables"
arch=('i686' 'x86_64')
makedepends=('cython' 'cython2')
license=('LGPL')
url="https://github.com/gplepage/gvar"
source=("${url}/archive/v${pkgver}.tar.gz")

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

sha256sums=('cb0fc700df13d4d880c43cc8347be0dd6b20fd7b90af33347680771d9cc6143f')
