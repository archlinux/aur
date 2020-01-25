# Maintainer: tuftedocelot tuftedocelot@fastmail.fm<
_pkgname=neo4j-python-driver
__pkgname=neo4j-driver
pkgname=python-$__pkgname
pkgver=1.7.6
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
arch=(any)
url="https://github.com/neo4j/neo4j-python-driver"
license=('Apache')
depends=('python' 'python-pytz')
makedepends=('python-setuptools')
source=("https://github.com/neo4j/$_pkgname/archive/$pkgver.zip")
sha256sums=('00752aef0b36b54ec5badbebda68d8a0c9df3f8101aa2a49f5dbf975c59d1b4b')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

