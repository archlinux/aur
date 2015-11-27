# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.10.2
pkgname=nodejs-eslint # All lowercase
pkgver=1.10.2
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('96f43422bf8ddeca7d5af537d83aa673fd24f536eeab587ea0bedbf99a0dfb3b')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
