_npmname=textlint-rule-ginger
_npmver=2.1.2
pkgname=textlint-rule-ginger # All lowercase
pkgver=2.1.2
pkgrel=1
pkgdesc="textlint rule to check your English grammar with Ginger Proofreading"
arch=(any)
url="https://github.com/textlint-rule/textlint-rule-ginger"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(6374a0b15ee19cdc087d1aedb341b9c960aff2b1)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
