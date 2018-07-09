_npmname=textlint-rule-write-good
_npmver=1.6.2
pkgname=textlint-rule-write-good # All lowercase
pkgver=1.6.2
pkgrel=1
pkgdesc="textlint rule to check your English style with write good"
arch=(any)
url="https://github.com/textlint-rule/textlint-rule-write-good"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(3c79b04091319d4e8be5fb442c596bf500e8493e)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
