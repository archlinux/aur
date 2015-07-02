# Maintainer : Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-taskflow-liberty
pkgver=0.13.0
pkgrel=1
pkgdesc="Taskflow for task-oriented systems"
url="https://launchpad.net/taskflow"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/taskflow/taskflow-$pkgver.tar.gz")
md5sums=('81a5a854718c54c610a3e7ff752269d1')

package() {
	cd $srcdir/taskflow-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
}

