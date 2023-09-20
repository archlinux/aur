# Mantainer: Snaporaz
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgbase="python-gvar"
pkgname=("python-gvar" "python2-gvar")
pkgver=11.11.3
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

sha256sums=('8c25a902451b3905a66739a1731150717c404e00d9816c48ca1cc8d364d72c0c')
