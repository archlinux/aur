_npmname=babel
_npmver=6.3.26
pkgname=nodejs-babel # All lowercase
pkgver=6.3.26
pkgrel=1
pkgdesc="Turn ES6 code into readable vanilla ES5 with source maps"
arch=(any)
url="https://babeljs.io/"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('7bf8967bd2de7c3645a107080094c2c9df706886')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
