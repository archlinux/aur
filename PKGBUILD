# Maintainer: Daniel Nagy <danielnagy at gmx de>

_npmname=http-proxy
_npmver=1.9.0
pkgname=nodejs-http-proxy # All lowercase
pkgver=1.9.0
pkgrel=1
pkgdesc="HTTP proxying for the masses"
arch=(any)
url="https://github.com/nodejitsu/node-http-proxy"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(adbb99b55027e15e802ef32737d2de3b88ef52a6)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
