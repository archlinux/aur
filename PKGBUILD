_npmname=textlint-rule-no-empty-section
_npmver=1.1.0
pkgname=textlint-rule-no-empty-section # All lowercase
pkgver=1.1.0
pkgrel=1
pkgdesc="textlint rule not allow to create empty section."
arch=(any)
url="https://github.com/azu/textlint-rule-no-empty-section"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(137ae6b8dfcaab759fd6068bfcc1a6c941bb4607)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
