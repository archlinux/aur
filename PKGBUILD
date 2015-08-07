# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor : Erhan SAHIN <erhan@ssahin.net>

pkgname=python-monotonic
pkgver=0.3
pkgrel=1
pkgdesc="An implementation of time.monotonic() for Python 2 & < 3.3"
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/m/monotonic/monotonic-$pkgver.tar.gz")
md5sums=('4d055924b13474f5ac65385b937124fe')

package() {
	cd $srcdir/monotonic-$pkgver
	python setup.py install --root=$pkgdir --optimize=1
}
