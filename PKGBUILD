# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.4.0
pkgname=nodejs-eslint # All lowercase
pkgver=1.4.0
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('b7b25f48cff6e32f83866b2844f54ac05a7597b285eca16c3323312197cff16e')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
