# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=2.1.0
pkgname=nodejs-eslint # All lowercase
pkgver=2.1.0
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('67ba1ec26be48c9202868be12979b754fe1867e281c685169862755b2fe0775d')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
