# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=redis-commander
pkgname=nodejs-redis-commander
pkgver=0.3.2
pkgrel=1
pkgdesc="Redis web-based management tool written in node.js"
arch=('any')
url="http://joeferner.github.io/redis-commander/"
depends=('nodejs')
license=('custom')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha1sums=('186e3dcdc736c782dc2d7daa5ebe90a784a17001')
# vim:set ts=2 sw=2 et:
