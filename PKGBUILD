# Maintainer: Python Zookeeper High-Level Libraries https://github.com/python-zk
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=kazoo
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=2.6.1
pkgrel=1
pkgdesc='kazoo implements a higher level API to Apache Zookeeper for Python clients.'
arch=('any')
url="https://github.com/python-zk/kazoo"
makedepends=('python-setuptools' 'python2-setuptools')
license=('APACHE')
source=("https://files.pythonhosted.org/packages/01/d6/77d8067b56ef78326b8cbc85d896e29cb9ceae996a24d752e1cb93011b85/kazoo-${pkgver}.tar.gz")
sha1sums=('SKIP')

package_python2-kazoo() {
	depends=('python2' 'python2-objgraph')
	cd "${srcdir}/${_name}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

package_python-kazoo() {
	depends=('python' 'python-objgraph')
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

