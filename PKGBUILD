_npmname=pug-lint
_npmver=2.5.0
pkgname=pug-lint # All lowercase
pkgver=2.5.0
pkgrel=1
pkgdesc="An unopinionated and configurable linter and style checker for Pug (formerly Jade)"
arch=(any)
url="https://github.com/pugjs/pug-lint"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(4419ee301aeca45f54061b0eca4a9a471f3aa9a9)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
