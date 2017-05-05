# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=prettier
_npmver=1.3.1
pkgname=prettier
pkgver=1.3.1
pkgrel=1
pkgdesc="An opinionated JavaScript formatter inspired by refmt with advanced support for language features from ES2017, JSX, and Flow"
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
sha1sums=('fa0ea84b45ac0ba6de6a1e4cecdcff900d563151')
sha256sums=('430224cad5d59caa9b43a0e72d423515e5f5e6e88400f1a7192753012094587d')
