_npmname=textlint-plugin-rst
_npmver=0.1.1
pkgname=textlint-plugin-rst # All lowercase
pkgver=0.1.1
pkgrel=1
pkgdesc="reStructuredText support for textlint"
arch=(any)
url=""
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(ee5f8c947a947d6b07c1c46515869632d56e06b5)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
