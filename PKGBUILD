_npmname=textlint
_npmver=10.2.1
pkgname=textlint # All lowercase
pkgver=10.2.1
pkgrel=1
pkgdesc="The pluggable linting tool for text and markdown."
arch=(any)
url="https://github.com/textlint/textlint/"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(ee22b7967d59cef7c74a04a5f4e8883134e5c79d)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
