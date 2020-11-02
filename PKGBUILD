# Maintainer: Nicholas Dahm <(first).(last) at gmail>

pkgname=python-neo4j
_pypiname=neo4j
_pypidir="ad/4c/6d58b9416d2d62c4115d4c6bd84e6f31ca98716f50ee9da7a5418cfa61d0"
pkgver=4.1.1
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
url="https://pypi.org/project/neo4j/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('b19efd8949adfd6330537bd97b2d0df88e4074b741f7db4c05427498915886ec')

package() {
	  cd ${_pypiname}-${pkgver}
	    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
	}
