# Maintainer: John Jenkins twodopeshaggy@gmail.com
_npmname=ghcal
pkgname=nodejs-ghcal
pkgver=1.1.0
pkgrel=1
pkgdesc="See the GitHub contributions calendar of a user in the command line."
arch=(any)
url="https://github.com/IonicaBizau/ghcal"
license=(MIT)
depends=('nodejs' 'npm')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
