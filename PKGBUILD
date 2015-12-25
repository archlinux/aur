_npmname=babel-cli
_npmver=6.3.13
pkgname=nodejs-babel # All lowercase
pkgver=6.3.13
pkgrel=2
pkgdesc="Turn ES6 code into readable vanilla ES5 with source maps"
arch=(any)
url="https://babeljs.io/"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('736fbe8f9aab26fb0545bd4d9dca1746d3e81334')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
