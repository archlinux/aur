# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=python-pid
pkgname=(python-pid python2-pid)
pkgver=2.0.1
pkgrel=1
pkgdesc='Python pid - pidfile featuring stale detection and file-locking'
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pid'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pid/pid-${pkgver}.tar.gz")
sha256sums=('054cde9c64b8ac979ec27f714e71ebb97ecf8388ea5fe29f6b93db222e92d433')

package_python-pid() {
	pkgdesc='Python pid - pidfile featuring stale detection and file-locking - python 3.x pkg'
	depends=('python')

	cd "${srcdir}/pid-${pkgver}"
	python3 setup.py install --root="${pkgdir}/" --optimize=0
}

package_python2-pid() {
	pkgdesc='Python pid - pidfile featuring stale detection and file-locking - python 2.x pkg'
	depends=('python2')

	cd "${srcdir}/pid-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=0
}

