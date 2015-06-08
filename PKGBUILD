# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Jacob Thornton <jacob@twitter.com> (https://github.com/fat)
# Contributor: fat <jacobthornton@gmail.com>
# Contributor: jonschlinkert <github@sellside.com>

_npmname=recess
_npmver=1.1.9
pkgname=nodejs-recess # All lowercase
pkgver=1.1.9
pkgrel=1
pkgdesc="A simple, attractive code quality tool for CSS built on top of LESS"
arch=(any)
url="http://twitter.github.com/recess"
license=(Apache-2.0)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(831c551f45df87d484c6123ffde91030bef1581a)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
