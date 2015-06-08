# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: mklabs
# Contributor: mklabs <daniel.mickael@gmail.com>

_npmname=connect-docco
pkgname=nodejs-connect-docco # All lowercase
pkgver=0.0.2
pkgrel=1
pkgdesc="docco middleware for connect. Mix it with socket.io and watch to get fancy automatic updates."
arch=(any)
url="http://github.com/mklabs/connect-docco"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(e75fe3432d2bdf142141f4eebe46b3d65dc9434d)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
