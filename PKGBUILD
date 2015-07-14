# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Megan Macinkowicz <violagirl23@gmail.com>

pkgname=python2-pymtp
_pkgname=PyMTP
pkgver=0.0.6
pkgrel=1
pkgdesc="LibMTP bindings in Python (python 2 version)"
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/PyMTP'
license=('GPL')
depends=('libmtp' 'python2')
makedepends=('python2-setuptools')
install=pymtp.install
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('23679b79ce5e2eebf987b0daeb351fb1')

package() {
	cd $_pkgname-$pkgver
	python2 setup.py install --root=$pkgdir/ --optimize=1
}
