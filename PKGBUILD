# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Ricardo da Silva
# Contributor: rmhsilva <rmh.pub@me.com>

_npmname=node-buspirate
_npmver=0.0.1
pkgname=nodejs-node-buspirate # All lowercase
pkgver=0.0.1
pkgrel=1
pkgdesc="Node.js bindings for Bus Pirate"
arch=(any)
url="https://github.com/rmhsilva/node-buspirate"
license=("BSD")
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(6377cfb093f1a1609ee2de3fd727417dee50367c)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
