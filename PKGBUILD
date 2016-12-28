pkgbase=python-dominate
pkgname=('python2-dominate' 'python-dominate')
pkgver=2.3.1
pkgrel=1
pkgdesc="Python library for creating and manipulating HTML documents"
arch=('any')
url="https://github.com/Knio/dominate"
license=('LGPL3')
makedepends=('python2-setuptools' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('1427a5c62ee91d8bcc441f7a7d302a85')
sha1sums=('6a17c98ec678c29ab4ec01824fb930849670b5d7')
sha256sums=('a87f37018b6a2389c7fe3d25d65164b6b55a481fe2c9bd21b0711b7a34729cb4')

package_python2-dominate() {
	depends=('python2')

	cd "$srcdir/dominate-${pkgver}"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-dominate() {
	depends=('python')

	cd "$srcdir/dominate-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
