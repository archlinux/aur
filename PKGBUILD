# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

_npmname=livescript
pkgname=nodejs-livescript
pkgver=1.5.0
pkgrel=1
pkgdesc="LiveScript is a language which compiles to JavaScript"
arch=(any)
url="http://livescript.net/"
license=('MIT')
depends=('nodejs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha1sums=('4fe7121c41217e4608e334eb9cbe1762e63e5566')

package() {
  cd "$srcdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
}

# vim:set ts=2 sw=2 et:
