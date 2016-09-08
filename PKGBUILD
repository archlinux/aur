# Maintainer Marco Pompili <aur@emarcs.org>

_npmname=markdown-styles
_npmver=3.1.8
pkgname=nodejs-markdown-styles # All lowercase
pkgver=3.1.8
pkgrel=1
pkgdesc="Markdown to HTML generator and multiple CSS themes for Markdown"
arch=(any)
url="https://github.com/mixu/markdown-styles#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('4a0063c0d4d2a9cd77790f60211348ed1d61bd21')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
