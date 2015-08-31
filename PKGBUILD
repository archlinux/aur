# Maintainer:  Boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

_npmname=atob
pkgname=nodejs-atob
pkgver=1.1.2
pkgrel=1
pkgdesc="atob for Node.JS, It turns base64-encoded ascii data back to binary."
arch=(any)
url="https://www.npmjs.com/package/atob"
license=( "Apache" )
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('d41125fe6ffb7b2b4df22d575a42517e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
