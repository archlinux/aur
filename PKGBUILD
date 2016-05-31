# Maintainer: Chris Salzberg <chris@dejimata.com>

_npmname=barcelona
_npmver=0.0.26
pkgname=nodejs-barcelona
pkgver=0.0.26
pkgrel=1
pkgdesc="Opinionated deployment pipeline tool"
arch=(any)
url="https://github.com/degica/barcelona-js"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=('a5412cb257cb456deb453d142f3d9989')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
