# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nodejitsu Inc. <info@nodejitsu.com>
# Contributor: indexzero <charlie.robbins@gmail.com>
# Contributor: mmalecki <me@mmalecki.com>
# Contributor: chjj <chjjeffrey@gmail.com>
# Contributor: V1 <info@3rd-Eden.com>

_npmname=winston
_npmver=0.9.0
pkgname=nodejs-winston # All lowercase
pkgver=0.9.0
pkgrel=1
pkgdesc="A multi-transport async logging library for Node.js"
arch=(any)
url="https://github.com/flatiron/winston"
license=("MIT")
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('b5726e6c42291e305e36286ce7ae9f3b74a527a8')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
