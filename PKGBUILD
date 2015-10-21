# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.7.3
pkgname=nodejs-eslint # All lowercase
pkgver=1.7.3
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('84d18e9f18297e3fa4ddd109d125df262e5e7e56b06663dde19233bdc121cd18')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
