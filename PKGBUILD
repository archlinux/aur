# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj@vision-media.ca>
# Contributor: tjholowaychuk <tj@vision-media.ca>
# Contributor: forbeslindesay <forbes@lindesay.co.uk>
# Contributor: bloodyowl <mlbli@me.com>
# Contributor: jbnicolai <jappelman@xebia.com>

_npmname=jade
_npmver=1.5.0
pkgname=nodejs-jade # All lowercase
pkgver=1.5.0
pkgrel=1
pkgdesc="Jade template engine"
arch=(any)
url="https://github.com/visionmedia/jade"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(74a93a5a290e11296c8b919b7a4d72301739b27e)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
