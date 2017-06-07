# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=prettier
_npmver=1.4.2
pkgname=prettier
pkgver=1.4.2
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
sha1sums=('bcdd95ed1eca434ac7f98ca26ea4d25a2af6a2ac')
sha256sums=('ed483f4075232b45503a8e39884c91609d3c3a18e3a01f9f8e404fc0b529326b')
