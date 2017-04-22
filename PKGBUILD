# Maintainer: Hugues Chabot <at google mail>
_npmname=budo
_npmver=10.0.3
pkgname=nodejs-budo # All lowercase
pkgver=10.0.3
pkgrel=1
pkgdesc="a browserify server for rapid prototyping"
arch=(any)
url="https://github.com/mattdesl/budo"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(8cdaf3b503aab5a7b70711fda24ca4cbb94c6124)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
