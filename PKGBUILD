_npmname=babel
_npmver=5.1.8
pkgname=nodejs-babel # All lowercase
pkgver=5.1.8
pkgrel=1
pkgdesc="Turn ES6 code into readable vanilla ES5 with source maps"
arch=(any)
url="https://babeljs.io/"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(11a571e8e49a1952a1d80ce02e17663a941e8f67)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et: