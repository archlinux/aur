_npmname=ramllint
_npmver=1.2.6
pkgname=ramllint # All lowercase
pkgver=1.2.6
pkgrel=1
pkgdesc="RAML Lint"
arch=(any)
url="https://github.com/QuickenLoans/ramllint#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(f392b5b2e0f7ad64cbe0d7a75f0061de7089bb57)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
