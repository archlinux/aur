# Maintainer : Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-monotonic
pkgver=0.3
pkgrel=1
pkgdesc="An implementation of time.monotonic() for Python 2 & < 3.3"
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/m/monotonic/monotonic-$pkgver.tar.gz")
md5sums=('4d055924b13474f5ac65385b937124fe')

package() {
	cd $srcdir/monotonic-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
}
