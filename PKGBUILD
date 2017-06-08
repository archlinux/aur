# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=prettier
_npmver=1.4.4
pkgname=prettier
pkgver=1.4.4
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
sha1sums=('a8d1447b14c9bf67e6d420dcadd10fb9a4fad65a')
sha256sums=('d8f8f446a063ce70a21a25901cefb6a8d83536ad3a2d60a6271aaef17d6247cc')
