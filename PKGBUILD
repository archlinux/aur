# Maintainer: Nicholas Dahm <(first).(last) at gmail>

# Update process
# Go to PyPI neo4j download page https://pypi.org/project/neo4j/#files
# Get latest URL to tar.gz, extract _pypidir and version
# Download and get sha256 checksum
# profit

pkgname=python-neo4j
_pypiname=neo4j
_pypidir="ba/9c/96069a907f845ec74a5031d7a2fa2cacfa2f52ad2f312ee1e9ba45364ff7"
pkgver=4.2.0
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
url="https://pypi.org/project/neo4j/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('a346f7b1681e31100c7bb0b3e60e755582f6bd60bb39a9b4ca50fd25207ffa2e')

package() {
	  cd ${_pypiname}-${pkgver}
	    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
	}
