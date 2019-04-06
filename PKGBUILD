# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=redis-commander
pkgname=nodejs-redis-commander
pkgver=0.6.4
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
sha1sums=('032612e7169b189064685389f0245aefb4211407')
# vim:set ts=2 sw=2 et:
