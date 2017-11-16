# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=prettier
_npmver=1.8.2
pkgname=prettier
pkgver=1.8.2
pkgrel=1
pkgdesc="An opinionated code formatter for JavScript, ES2017, JSX, Flow, TypeScript, JSON, CSS, LESS, SCSS, GraphQL, Markdown"
arch=(any)
url="https://github.com/jlongster/prettier"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
sha1sums=('bff83e7fd573933c607875e5ba3abbdffb96aeb8')
sha256sums=('cc7970a235d72b90e93be8161aa03e74d840adda3d8814f08732f23618416377')
