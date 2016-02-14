# Maintainer: Ian D. Scott <ian@perebruin.com>

pkgname=rpython
pkgver=0.1.4
pkgrel=1
pkgdesc="Restricted python compiler"
url="http://pypy.org"
arch=('any')
depends=('python2' 'python2-setuptools' 'python2-pytest')
license=('MIT')
source=("https://pypi.python.org/packages/source/r/rpython/rpython-${pkgver}.tar.gz")
md5sums=('680fcee2fed5f94fcb4390130510eec9')


package() {
	cd ${pkgname}-$pkgver
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
