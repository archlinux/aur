_npmname=textlint-rule-alex
_npmver=1.3.1
pkgname=textlint-rule-alex # All lowercase
pkgver=1.3.1
pkgrel=1
pkgdesc="textlint rule for alex"
arch=(any)
url="https://github.com/textlint-rule/textlint-rule-alex"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(eb38609eba445f2431bb1927db7227993da943fe)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
