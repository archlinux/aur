# Maintainer: Arnau Sanchez <pyarnau@gmail.com>
_npmname=js-beautify
_npmver=1.5.10
pkgname=js-beautify # All lowercase
pkgver=1.5.10
pkgrel=2
pkgdesc="Beautify JavaScript/JSON (jsbeautifier.org)"
arch=(any)
license=('MIT')
url="http://jsbeautifier.org/"
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(4d95371702699344a516ca26bf59f0a27bb75719)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
