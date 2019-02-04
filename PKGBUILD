# Maintainer: VergeDX <wxy20001225@126.com>

_npmname=pxder
_npmver=2.6.3
pkgname=nodejs-pxder # All lowercase
pkgver=2.6.3
pkgrel=1
pkgdesc="Download illusts from pixiv.net"
arch=(any)
url="https://github.com/Tsuk1ko/pxder#readme"
license=(GPL-3.0-or-later)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(9b2613e07c47a5020bc17dea6e2115ead67e1387)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
