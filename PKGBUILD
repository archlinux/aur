# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=typescript
_npmver=1.5.3
pkgname=nodejs-typescript
pkgver=1.5.3
pkgrel=1
pkgdesc="TypeScript is a language for application scale JavaScript development."
arch=('any')
url="http://typescriptlang.org/"
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
sha1sums=('ce35e55f75b7a8d0ed571b503bd0a57157e523f7')
# vim:set ts=2 sw=2 et:
