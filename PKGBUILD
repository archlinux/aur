_npmname=textlint-rule-no-start-duplicated-conjunction
_npmver=2.0.2
pkgname=textlint-rule-no-start-duplicated-conjunction # All lowercase
pkgver=2.0.2
pkgrel=1
pkgdesc="textlint rule that check no start with duplicated conjunction."
arch=(any)
url="https://github.com/textlint-rule/textlint-rule-no-start-duplicated-conjunction"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(49612a49dca18bbe5468019836b5c9be24c09e79)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
