# Maintainer: tuftedocelot tuftedocelot@fastmail.fm<
_pkgname=neo4j-python-driver
__pkgname=neo4j-driver
pkgname=python-$__pkgname
pkgver=1.6.2
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
arch=(any)
url="https://github.com/neo4j/neo4j-python-driver"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/neo4j/$_pkgname/archive/$pkgver.zip")
sha256sums=('a020a279e70691398c41331bfed649ac9d3093ef3849facd03b10be02877704d')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

