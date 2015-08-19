# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=share-term
_npmver=1.1.0
pkgname=nodejs-share-term
pkgver=1.1.0
pkgrel=1
pkgdesc="Share the terminal with your friends."
arch=('any')
url="http://share-term.me/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha1sums=('b6e6698b634d8cf46e6e8a56aa2ddfabc5b87a5f')
# vim:set ts=2 sw=2 et:
