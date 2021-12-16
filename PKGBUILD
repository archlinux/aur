# Maintainer: Nicholas Dahm <(first).(last) at gmail>

# Update process
# Go to PyPI neo4j download page https://pypi.org/project/neo4j/#files
# Get latest URL to tar.gz, extract _pypidir and version
# Download and get sha256 checksum
# profit

pkgname=python-neo4j
_pypiname=neo4j
_pypidir="de/7e/0ca5c25397604db33df4e45a13a5b6ae3d28f47f536bdf6e979bd30c18ba"
pkgver=4.4.0
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
url="https://pypi.org/project/neo4j/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('7fac86ecd4191248030a2bf7822547207648ed8e0ee38cf10bbd7c7dc6ca596f')

package() {
	  cd ${_pypiname}-${pkgver}
	    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
	}
