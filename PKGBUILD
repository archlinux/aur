# Maintainer:  Boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

_npmname=btoa
pkgname=nodejs-btoa
pkgver=1.1.2
pkgrel=1
pkgdesc="btoa for Node.JS. it turns binary data to base64-encoded ascii."
arch=(any)
url="https://www.npmjs.com/package/btoa"
license=( "Apache" )
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('f8c18b7c096634fc05430ef9a2d8d4b9')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
