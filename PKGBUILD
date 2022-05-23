_npmname=dockerfile-utils
_npmver=0.10.0
pkgname=nodejs-dockerfile-utils
pkgver=0.10.0
pkgrel=1
pkgdesc="Utilities for formatting and linting a Dockerfile."
arch=(any)
url="https://github.com/rcjsuen/dockerfile-utils#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('5aa16271388f9b718687f8a1df156c077f169154')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
