_npmname=stylint
_npmver=1.5.9
pkgname=stylint # All lowercase
pkgver=1.5.9
pkgrel=1
pkgdesc="A linter for stylus"
arch=(any)
url="https://github.com/SimenB/stylint#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(29f4dc129fa1ca22150cd867223cee2bed5ff6a2)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
