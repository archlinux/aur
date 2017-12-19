_npmscope=@angular
_npmname=cli
_npmver=1.6.1
pkgname=angular-cli # All lowercase
pkgver=1.6.1
pkgrel=1
pkgdesc="CLI tool for Angular"
arch=(any)
url="https://github.com/angular/angular-cli"
license=()
depends=('nodejs' 'npm' )
optdepends=()
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmscope/$_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
