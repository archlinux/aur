# Maintainer: tuftedocelot tuftedocelot@fastmail.fm<
_pkgname=neo4j-python-driver
__pkgname=neo4j-driver
pkgname=python-$__pkgname
pkgver=4.0.1
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
arch=(any)
url="https://github.com/neo4j/neo4j-python-driver"
license=('Apache')
depends=('python' 'python-pytz' 'python-neotime' 'python-neobolt')
makedepends=('python-setuptools')
source=("https://github.com/neo4j/$_pkgname/archive/$pkgver.zip")
sha256sums=('ac21559546202cac03a21891c0b44ac6cc5a96f0deb0d4fbbdbc026851d61763')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

