_npmname=textlint-rule-unexpanded-acronym
_npmver=1.2.1
pkgname=textlint-rule-unexpanded-acronym # All lowercase
pkgver=1.2.1
pkgrel=1
pkgdesc="textlint rule that check unexpanded acronym word."
arch=(any)
url="https://github.com/azu/textlint-rule-unexpanded-acronym"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(4e5c649898fea702c23683b60d46fe97fd903117)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
