# Maintainer: Hugues Chabot <at google mail>
_npmname=budo
_npmver=11.1.0
pkgname=nodejs-budo # All lowercase
pkgver=11.1.0
pkgrel=1
pkgdesc="a browserify server for rapid prototyping"
arch=(any)
url="https://github.com/mattdesl/budo"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(a1ef4cabf023713e74d6ca59585a2c44797f8c1f)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
