# Maintainer: 
# Contributor: Felix Golatofski
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Christopher Jeffrey
# Contributor: chjj <chjjeffrey@gmail.com>

_npmname=marked
_npmver=1.0.0
pkgname=nodejs-marked # All lowercase
pkgver=1.0.0
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=(any)
url="https://github.com/chjj/marked"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('b62fe9a0becb01b82e9cf0f0c4ea92b026619528b8c6f446ed96c96b27cc5871')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
