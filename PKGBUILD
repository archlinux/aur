# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nodejitsu Inc. <info@nodejitsu.com>
# Contributor: indexzero <charlie.robbins@gmail.com>
# Contributor: bradleymeck <bradley.meck@gmail.com>
# Contributor: avianflu <charlie@charlieistheman.com>
# Contributor: mmalecki <me@mmalecki.com>

_npmname=forever
_npmver=0.10.9
pkgname=nodejs-forever # All lowercase
pkgver=0.10.9
pkgrel=1
pkgdesc="A simple CLI tool for ensuring that a given node script runs continuously (i.e. forever)"
arch=(any)
url="http://github.com/nodejitsu/forever"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e4849f459ec27d5a6524fd466e67dfd6222bd9bb)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
