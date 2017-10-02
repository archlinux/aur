# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=python-pid
pkgname=(python-pid python2-pid)
pkgver=2.1.1
pkgrel=1
pkgdesc='Python pid - pidfile featuring stale detection and file-locking'
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pid'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
# There's a gpg signature, but no matching key. Where to get it?
source=("https://pypi.io/packages/source/p/pid/pid-${pkgver}.tar.gz")
sha256sums=('b443169d3dc21397695b4a82016fadb4cfdb0ed8b2ddb4aaa428e1701bb34e1f')

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

