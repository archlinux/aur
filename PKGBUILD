# Maintainer: Oleh Prypin <oleh@pryp.in>
# Contributor: Lance Chen <cyen0312+aur@gmail.com>

_npmname=livescript
pkgname=nodejs-livescript
pkgver=1.6.0
pkgrel=1
pkgdesc="LiveScript is a language which compiles to JavaScript"
arch=(any)
url="http://livescript.net/"
license=('MIT')
depends=('nodejs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha1sums=('5c4e3860109640bb6a4a0441e4dd13f4eb0e7f0a')

package() {
  cd "$srcdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
}
