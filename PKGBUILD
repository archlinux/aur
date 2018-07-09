_npmname=textlint-rule-date-weekday-mismatch
_npmver=1.0.5
pkgname=textlint-rule-date-weekday-mismatch # All lowercase
pkgver=1.0.5
pkgrel=1
pkgdesc="textlint rule that found mismatch between date and weekday."
arch=(any)
url="https://github.com/azu/textlint-rule-date-weekday-mismatch"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2ac2568be5149d65d4a9a507e9aa887f7d50c60b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
