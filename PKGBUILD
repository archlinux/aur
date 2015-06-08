# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Andris Reinman
# Contributor: andris <andris@node.ee>

_npmname=node-markdown
pkgname=nodejs-node-markdown # All lowercase
pkgver=0.1.1
pkgrel=1
pkgdesc="Parse Markdown syntax with node.js"
arch=(any)
url="http://github.com/andris9/node-markdown"
license=(BSD)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(e365baba38d4ac56d8563dd69ca6d7215b08fb94)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
