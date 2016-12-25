_npmname=vue-cli
_npmver=2.6.0
pkgname=nodejs-vue-cli # All lowercase
pkgver=2.6.0
pkgrel=1
pkgdesc="A simple CLI for scaffolding Vue.js projects."
arch=(any)
url="https://github.com/vuejs/vue-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('58010b2ebc9e33ae027eff0d02b1a7bb853c8762')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
