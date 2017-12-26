# Maintainer: tuftedocelot tuftedocelot@fastmail.fm<
_pkgname=neo4j-python-driver
__pkgname=neo4j-driver
pkgname=python-$__pkgname
pkgver=1.5.3
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
arch=(any)
url="https://github.com/neo4j/neo4j-python-driver"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/neo4j/$_pkgname/archive/$pkgver.zip")
sha256sums=('e3a6c7d75c0f2d4ce8517d03a62e8e6887e7dd386d7e784c0ff7c658185fbd30')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

