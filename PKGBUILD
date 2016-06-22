# Substantially copied from the nodejs-forever package.

_npmname=iced-coffee-script
_npmver=108.0.9
pkgname=iced-coffee-script
pkgver=108.0.9
pkgrel=1
pkgdesc="CoffeeScript with await/defer syntax added"
arch=(any)
url="https://maxtaco.github.io/coffee-script/"
license=()
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(91f756b11cb74831ae632957d58e7233f7f092d2)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
