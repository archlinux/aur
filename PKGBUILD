# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=prettier
_npmver=1.4.0
pkgname=prettier
pkgver=1.4.0
pkgrel=1
pkgdesc="An opinionated JavaScript formatter inspired by refmt with advanced support for language features from ES2017, JSX, Flow, TypeScript, CSS/LESS/SCSS"
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
sha1sums=('e648862b3737c85e3592cf85571dc42939bb5216')
sha256sums=('667609131e1975170bceba6526e0c4173a6463b78c4063b7343a42a5f74877f1')
