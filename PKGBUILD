# Maintainer Marco Pompili <aur@emarcs.org>

_npmname=markdown-styles
_npmver=3.1.9
pkgname=nodejs-markdown-styles # All lowercase
pkgver=3.1.9
pkgrel=1
pkgdesc="Markdown to HTML generator and multiple CSS themes for Markdown"
arch=(any)
url="https://github.com/mixu/markdown-styles#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('2ca4e6d64c1397f77392b01a910f4da61d2a7e29')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
