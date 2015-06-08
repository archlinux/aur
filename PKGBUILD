# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Matthew Eernisse <mde@fleegix.org> (http://fleegix.org)
# Contributor: mde <mde@fleegix.org>

_npmname=jake
_npmver=0.7.3
pkgname=nodejs-jake # All lowercase
pkgver=0.7.3
pkgrel=1
pkgdesc="JavaScript build tool, similar to Make or Rake"
arch=(any)
url="http://github.com/mde/jake"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('e5321b99bce65798a5408d7586fb803581cf70f4')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
