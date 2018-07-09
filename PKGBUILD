_npmname=textlint-rule-max-comma
_npmver=1.0.4
pkgname=textlint-rule-max-comma # All lowercase
pkgver=1.0.4
pkgrel=1
pkgdesc="textlint rule that limit maxinum comma(,) count of sentence."
arch=(any)
url="https://github.com/azu/textlint-rule-max-comma#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(f555c97e0d3039ca7da06cfd1afad0e5f5899a37)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
