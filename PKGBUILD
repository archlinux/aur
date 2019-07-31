_npmname=pxder
_npmver=2.7.3
pkgname=nodejs-pxder # All lowercase
pkgver=2.7.3
pkgrel=1
pkgdesc="Download illusts from pixiv.net P站插画批量下载器"
arch=(any)
url="https://github.com/Tsuk1ko/pxder#readme"
license=(GPL-3.0-or-later)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(68a0eeb72afb5192b1d6a801f5b9d363baf1c132)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
