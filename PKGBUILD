# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=clocker
_npmver=1.9.0
pkgname=nodejs-clocker
pkgver=1.9.0
pkgrel=1
pkgdesc="."
arch=('any')
url="https://github.com/substack/clocker"
license=('MIT')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
#  npm config set python /usr/bin/python2
  npm install --python=/usr/bin/python2 -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha1sums=('3150535aa82b50defadb63bae9af8c68aa38705a')
# vim:set ts=2 sw=2 et:
