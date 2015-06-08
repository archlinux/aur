# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Christopher Jeffrey
# Contributor: chjj <chjjeffrey@gmail.com>

_npmname=marked
_npmver=0.2.9
pkgname=nodejs-marked # All lowercase
pkgver=0.2.9
pkgrel=2
pkgdesc="A markdown parser built for speed"
arch=(any)
url="https://github.com/chjj/marked"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(7acede9852f847ad4b347201b2c4c18c9d38e5c9)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
