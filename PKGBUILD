# Mantainer: Snaporaz
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgbase="python-gvar"
pkgname=("python-gvar" "python2-gvar")
pkgver=13.0.2
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

sha256sums=('249b747e03e45c4aa04e41596b0baf7f7c7e2c827087d6e9b63c5bf79a97a4c3')
