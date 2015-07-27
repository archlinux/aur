_npmname=babel
_npmver=5.8.9
pkgname=nodejs-babel # All lowercase
pkgver=5.8.9
pkgrel=1
pkgdesc="Turn ES6 code into readable vanilla ES5 with source maps"
arch=(any)
url="https://babeljs.io/"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('e62d271fe3e6bc264da71c094364207e42db23d9')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
