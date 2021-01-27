# Maintainer: Kasper L. Stilling <klstilling@gmail.com>

_npmname=textlint-rule-en-capitalization
_npmver=2.0.3
pkgname=textlint-rule-en-capitalization
pkgver=2.0.3
pkgrel=1
pkgdesc="textlint rule that check capitalization in english text"
arch=(any)
url="https://github.com/textlint-rule/textlint-rule-en-capitalization"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(6b05e5adcc58caed87abfe6fefea88e20c89d7e5)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
