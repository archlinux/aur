_npmname=dockerfile-utils
_npmver=0.0.13
pkgname=nodejs-dockerfile-utils
pkgver=0.0.13
pkgrel=1
pkgdesc="Utilities for formatting and linting a Dockerfile."
arch=(any)
url="https://github.com/rcjsuen/dockerfile-utils#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(43dd955e6c4d2c4c844216b7128d5a95b8fdc783)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
