_npmname=vue-cli
_npmver=2.8.2
pkgname=nodejs-vue-cli # All lowercase
pkgver=2.8.2
pkgrel=1
pkgdesc="A simple CLI for scaffolding Vue.js projects."
arch=(any)
url="https://github.com/vuejs/vue-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('27e81510c79f82ffd4af52c8ace4764a34fe1abd')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
