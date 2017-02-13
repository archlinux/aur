_npmnamespace=@angular
_npmname=cli
_npmver=1.0.0-beta.31
pkgname=angular-cli # All lowercase
pkgver=1.0.0_beta.31
pkgrel=1
pkgdesc="CLI tool for Angular"
arch=(any)
url="https://github.com/angular/angular-cli"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmnamespace/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('ba1234a2dcc5f4d4a58ac22568ac6fc518a0cfbf')
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmnamespace/$_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
