_npmname=textlint-rule-common-misspellings
_npmver=1.0.1
pkgname=textlint-rule-common-misspellings # All lowercase
pkgver=1.0.1
pkgrel=1
pkgdesc="textlint rule to check common misspellings"
arch=(any)
url="https://github.com/io-monad/textlint-rule-common-misspellings"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(8c4133cf3bb59aa159199d2c9bced12413365774)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
