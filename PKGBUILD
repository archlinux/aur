_npmname=remark-cli
_npmver=5.0.0
pkgname=remark-cli # All lowercase
pkgver=5.0.0
pkgrel=1
pkgdesc="CLI to process markdown with remark using plugins"
arch=(any)
url="http://remark.js.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(9feefd06474f3d0ff132df21b5334c546df12ab6)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
