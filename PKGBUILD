# Maintainer: Nicholas Dahm <(first).(last) at gmail>

# Update process
# Go to PyPI neo4j download page https://pypi.org/project/neo4j/#files
# Get latest URL to tar.gz, extract _pypidir and version
# Download and get sha256 checksum
# profit

pkgname=python-neo4j
_pypiname=neo4j
_pypidir="fe/a0/f085e0b6b3f93e207408a529d9bc738c0d3a3583a4e6a178a805928c14b6"
pkgver=4.4.4
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
url="https://pypi.org/project/neo4j/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('4f8982028021f9fc5e3e3605e6368302d6a97ea75a48666ae49fcc974113a3c8')

package() {
	  cd ${_pypiname}-${pkgver}
	    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
	}
