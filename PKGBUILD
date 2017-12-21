_npmname=create-elm-app
_npmver=1.10.1
pkgname=create-elm-app
pkgver=1.10.1
pkgrel=1
pkgdesc="Create Elm apps with zero configuration"
arch=(any)
url="https://github.com/halfzebra/create-elm-app"
license=()
depends=('nodejs' 'npm' )
optdepends=()
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
