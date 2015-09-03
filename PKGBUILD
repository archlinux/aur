# Maintainer: Daniel Nagy <danielnagy at gmx de>

_npmname=uglify-js
_npmver=2.4.24
pkgname=nodejs-uglify-js # All lowercase
pkgver=$_npmver
pkgrel=1
pkgdesc="JavaScript parser, mangler/compressor and beautifier toolkit"
arch=(any)
url="http://lisperator.net/uglifyjs"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('fad5755c1e1577658bb06ff9ab6e548c95bebd6e')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
