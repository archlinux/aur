# Maintainer : Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-taskflow
_pkgname=taskflow
pkgver=0.1.3
pkgrel=1
pkgdesc="Structured state management library"
url="https://launchpad.net/taskflow"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('e0b469d7647fe316583e20f60d041702')

package() {
	cd $srcdir/$_pkgname-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
}

