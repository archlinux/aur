# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=redis-commander
pkgname=nodejs-redis-commander
pkgver=0.4.4
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
sha1sums=('463ee58f658744db1669b3a53a3c081723360979')
# vim:set ts=2 sw=2 et:
