_npmname=textlint-rule-max-number-of-lines
_npmver=1.0.3
pkgname=textlint-rule-max-number-of-lines # All lowercase
pkgver=1.0.3
pkgrel=1
pkgdesc="textlint rule for linting number of lines."
arch=(any)
url="https://github.com/azu/textlint-rule-max-number-of-lines"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(fce661d5042388449396164e830778d024f2e59b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
