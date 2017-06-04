_npmname=lumo-cljs
_npmver=1.5.0
pkgname=nodejs-lumo-cljs # All lowercase
pkgver=1.5.0
pkgrel=1
pkgdesc="Fast, cross-platform, standalone ClojureScript REPL"
arch=(any)
url="https://github.com/anmonteiro/lumo"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(93af1b9cfccc12edfd495d64aec1748d4145f8dc)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
