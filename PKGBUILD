# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=prettier
_npmver=0.0.5
pkgname=prettier
pkgver=0.0.5
pkgrel=1
pkgdesc="An opinionated JavaScript formatter inspired by refmt with advanced support for language features from ES2017, JSX, and Flow"
arch=(any)
url="https://github.com/jlongster/prettier"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(9f3a67b57e5836d925e7038ea841580915c039eb)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
