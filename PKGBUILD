# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=typescript-tools
_npmver=0.3.1
pkgname=typescript-tools
pkgver=0.3.1
pkgrel=1
pkgdesc="Typescript-Tools"
arch=('any')
url="https://github.com/clausreinke/typescript-tools"
license=('Apache')
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

sha1sums=('325852bbe945c30210a636ce763307707a53c449')
# vim:set ts=2 sw=2 et:
