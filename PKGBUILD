# Maintainer: Hugues Chabot <at google mail>
_npmname=budo
_npmver=11.6.0
pkgname=nodejs-budo # All lowercase
pkgver=11.6.0
pkgrel=1
pkgdesc="a browserify server for rapid prototyping"
arch=(any)
url="https://github.com/mattdesl/budo"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2390d7c0a52091341277c78dc6871e7011f103bc)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
