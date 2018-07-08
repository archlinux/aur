_npmname=sass-lint
_npmver=1.12.1
pkgname=sass-lint # All lowercase
pkgver=1.12.1
pkgrel=1
pkgdesc="All Node Sass linter!"
arch=(any)
url="https://github.com/sasstools/sass-lint"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(630f69c216aa206b8232fb2aa907bdf3336b6d83)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
