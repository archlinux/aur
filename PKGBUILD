# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Jeremy Ashkenas
# Contributor: jashkenas <jashkenas@gmail.com>

_npmname=docco
pkgname=nodejs-docco # All lowercase
pkgver=0.7.0
pkgrel=1
pkgdesc="The Quick and Dirty Literate Programming Documentation Generator"
arch=(any)
url="http://jashkenas.github.io/docco/"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('d606e5a990cba052ca1e1803a9c587ecee3c5c38')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
