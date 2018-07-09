_npmname=textlint-rule-period-in-list-item
_npmver=0.2.0
pkgname=textlint-rule-period-in-list-item # All lowercase
pkgver=0.2.0
pkgrel=1
pkgdesc="textlint rule that check with or without period in list item."
arch=(any)
url="https://github.com/azu/textlint-rule-period-in-list-item"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e09da271c5c4e57301f98f2da607c51afbd15ed3)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
