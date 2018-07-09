_npmname=textlint-rule-ng-word
_npmver=1.0.0
pkgname=textlint-rule-ng-word # All lowercase
pkgver=1.0.0
pkgrel=1
pkgdesc="textlint rule that check NG words"
arch=(any)
url="https://github.com/KeitaMoromizato/textlint-rule-ng-word#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(b389a239ea4b4992f455e2af36bb062fc6e42d39)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
