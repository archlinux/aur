# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=prettier
_npmver=1.7.0
pkgname=prettier
pkgver=1.7.0
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
sha1sums=('47481588f41f7c90f63938feb202ac82554e7150')
sha256sums=('850b56991e89403d3d1f5a22c5762ea0385671d9d09a6ed96bcc3ae9f37a6338')
