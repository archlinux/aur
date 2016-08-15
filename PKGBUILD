# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>

_npmname=istanbul
_npmver=0.4.4
pkgname=nodejs-istanbul # All lowercase
pkgver=0.4.4
pkgrel=1
pkgdesc="Yet another JS code coverage tool that computes statement, line, function and branch coverage with module loader hooks to transparently add coverage when running tests. Supports all JS coverage use cases including unit tests, server side functional tests "
arch=(any)
url="https://github.com/gotwarlost/istanbul#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e8cf718dfedb713c8334ab9ffade35f1042d2a56)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
