# Maintainer : Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-taskflow-kilo
pkgver=0.7.1
pkgrel=1
pkgdesc="Taskflow for task-oriented systems"
url="https://launchpad.net/taskflow"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/taskflow/taskflow-$pkgver.tar.gz")
md5sums=('188512b3d1b5cf296fd912e24b9fb171')

package() {
	cd $srcdir/taskflow-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
}

