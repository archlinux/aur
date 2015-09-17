# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=typescript
_npmver=1.6.2
pkgname=nodejs-typescript
pkgver=1.6.2
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
sha256sums=('d553c416b02772452a8b3e0a6dd9db735c5d40154e99f1b1d6b730a2f0d6cbd2')
# vim:set ts=2 sw=2 et:
