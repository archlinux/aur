_npmname=textlint-rule-no-todo
_npmver=2.0.0
pkgname=textlint-rule-no-todo # All lowercase
pkgver=2.0.0
pkgrel=1
pkgdesc="textlint rule: warn TODO text."
arch=(any)
url="https://github.com/azu/textlint-rule-no-todo"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(877b8e60c34cf84df3957d694e5d0f5c2158b72f)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
