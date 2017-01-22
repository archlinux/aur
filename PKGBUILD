# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=lebab
_npmver=2.7.0
pkgname=lebab # All lowercase
pkgver=2.7.0
pkgrel=1
pkgdesc="Turn your JavaScript ES5 code into readable ES6/ES7"
arch=(any)
url="https://github.com/mohebifar/lebab"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e233a8039a5ea10fc1573f2a309b7e57bcbdab30)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
