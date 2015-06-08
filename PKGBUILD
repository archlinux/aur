# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Jeremy Ashkenas
# Contributor: jashkenas <jashkenas@gmail.com>

_npmname=docco
_npmver=0.6.2
pkgname=nodejs-docco # All lowercase
pkgver=0.6.2
pkgrel=1
pkgdesc="The Quick and Dirty Literate Programming Documentation Generator"
arch=(any)
url="http://jashkenas.github.io/docco/"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('9dad33b9d4587e0b725c5d7f1e2ede8710afb804')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
