# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=ionic
_npmver=1.6.3
pkgname=nodejs-ionic
pkgver=1.6.3
pkgrel=1
pkgdesc="A tool for creating and building Ionic Framework mobile apps."
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('d479cfc2134d2d92551af09f6ff19dd151adb6b5ccd071767f69288990bb7598')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
