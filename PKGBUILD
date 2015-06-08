_npmname=foreman
_npmver=1.3.0
pkgname=nodejs-foreman # All lowercase
pkgver=1.3.0
pkgrel=1
pkgdesc="Node Implementation of Foreman"
arch=(any)
url="http://strongloop.github.io/node-foreman/"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(fa2824c0ca7d77f8fc347be5adb84a4b0c13f5a2)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
