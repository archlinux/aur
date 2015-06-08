# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj@vision-media.ca>
# Contributor: Dominic Baggott <dominic.baggott@gmail.com> (http://evilstreak.co.uk)
# Contributor: Ash Berlin <ash_markdownjs@firemirror.com> (http://ashberlin.com)
# Contributor: ashb <ash.berlin@gmail.com>
# Contributor: dom <dominic.baggott@gmail.com>

_npmname=markdown
_npmver=0.5.0
pkgname=nodejs-markdown # All lowercase
pkgver=0.5.0
pkgrel=1
pkgdesc="A sensible Markdown parser for javascript"
arch=(any)
url="http://github.com/evilstreak/markdown-js"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(28205b565a8ae7592de207463d6637dc182722b2)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
