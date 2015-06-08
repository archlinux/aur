# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=typescript
_npmver=1.4.1
pkgname=nodejs-typescript
pkgver=1.4.1
pkgrel=1
pkgdesc="TypeScript is a language for application scale JavaScript development."
arch=('any')
url="http://typescriptlang.org/"
license=('Apache')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha1sums=('eb4da986d1b7f01452eafb57559e0cc8f516cd48')
# vim:set ts=2 sw=2 et:
