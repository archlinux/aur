# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=redis-commander
pkgname=nodejs-redis-commander
pkgver=0.4.3
pkgrel=1
pkgdesc="Redis web-based management tool written in node.js"
arch=('any')
url="http://joeferner.github.io/redis-commander/"
depends=('nodejs')
license=('MIT')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha1sums=('baf3165eeee512b8e409b98d2c0f5c22a94fc688')
# vim:set ts=2 sw=2 et:
