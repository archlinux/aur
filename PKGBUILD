_npmname=happiness
_npmver=10.0.2
pkgname=happiness # All lowercase
pkgver=10.0.2
pkgrel=1
pkgdesc="JavaScript Happiness Style"
arch=(any)
url="https://github.com/JedWatson/happiness"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(49d92442feba32874cabcbcf35e2390d412d997e)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
