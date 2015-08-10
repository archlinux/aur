# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj@vision-media.ca>
# Contributor: tjholowaychuk <tj@vision-media.ca>
# Contributor: forbeslindesay <forbes@lindesay.co.uk>
# Contributor: bloodyowl <mlbli@me.com>
# Contributor: jbnicolai <jappelman@xebia.com>

_npmname=jade
_npmver=1.11.0
pkgname=nodejs-jade # All lowercase
pkgver=1.11.0
pkgrel=1
pkgdesc="A clean, whitespace-sensitive template language for writing HTML"
arch=(any)
url="http://jade-lang.com"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(9c80e538c12d3fb95c8d9bb9559fa0cc040405fd)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
