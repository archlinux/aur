_npmname=svgo
_npmver=0.5.0
pkgname=nodejs-svgo # All lowercase
pkgver=0.5.0
pkgrel=1
pkgdesc="Nodejs-based tool for optimizing SVG vector graphics files."
arch=(any)
url="https://github.com/svg/svgo"
license=(MIT)
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2c4bc220fc204ed1896639dfb71837177e52bfc8)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
