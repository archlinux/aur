# Contributor: David Vogt <dave@winged.ch>
_npmname=typescript-tools
_npmver=0.7.0
pkgname=typescript-tools
pkgver=0.7.0
pkgrel=1
pkgdesc="Typescript-Tools"
arch=('any')
url="https://github.com/clausreinke/typescript-tools"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=(https://github.com/clausreinke/$_npmname/archive/v$_npmver.tar.gz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd typescript-tools-$pkgver
  npm install -g --prefix "$pkgdir/usr"
}

sha1sums=('b2d4dd791cc236695c118d0cf9adad97a43410e5')
# vim:set ts=2 sw=2 et:
