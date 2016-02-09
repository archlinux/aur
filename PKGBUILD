_npmname=babel-cli
_npmver=6.5.1
pkgname=nodejs-babel # All lowercase
pkgver=6.5.1
pkgrel=1
pkgdesc="Turn ES6 code into readable vanilla ES5 with source maps"
arch=(any)
url="https://babeljs.io/"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('446195f282320bc8b570d5d94757eead42533b4f')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
