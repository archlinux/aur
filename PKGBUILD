# Maintainer: Daniel Nagy <danielnagy at gmx de>

_npmname=uglify-js
_npmver=2.4.23
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
sha1sums=('be05aa6b22f1a83b21b2a49ce60fb5dffda00515')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
