# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Danny Coates <dannycoates@gmail.com>
# Contributor: Danny Coates <dannycoates@gmail.com>
# Contributor: 3y3 <3y3@bk.ru>
# Contributor: Adam Hořčica <horcicaa@gmail.com>
# Contributor: Akzhan Abdulin <akzhan.abdulin@gmail.com>
# Contributor: cattail <zhongchiyu@gmail.com>
# Contributor: Dave <badave@gmail.com>
# Contributor: Dick Hardt <dickhardt@gmail.com>
# Contributor: Gary Katsevman <git@gkatsev.com>
# Contributor: Glenn Block <glenn.block@gmail.com>
# Contributor: Ionuț G. Stan <ionut.g.stan@gmail.com>
# Contributor: Karan Batra-Daitch <karanganesha04@gmail.com>
# Contributor: Kasper Ligaard <kasperligaard@gmail.com>
# Contributor: Mark Constable <markc@renta.net>
# Contributor: Matthew O'Riordan <matthew.oriordan@gmail.com>
# Contributor: Michael Schoonmaker <michael@strongloop.com>
# Contributor: Miroslav Bajtos <miroslav@strongloop.com>
# Contributor: Panagiotis Astithas <pastith@gmail.com>
# Contributor: Peter Flannery <flannery.peter@ntlworld.com>
# Contributor: Philip Tellis <philip.tellis@gmail.com>
# Contributor: Sam Roberts <sam@strongloop.com>
# Contributor: Sergey Krilov <serg.kr@gmail.com>
# Contributor: ssafejava <s@safejava.com>
# Contributor: dannycoates <dannycoates@gmail.com>
# Contributor: piscisaureus <bertbelder@gmail.com>
# Contributor: bajtos <miroslav@strongloop.com>
# Contributor: strongloop <callback@strongloop.com>

_npmname=node-inspector
_npmver=0.7.4
pkgname=nodejs-node-inspector # All lowercase
pkgver=0.7.4
pkgrel=1
pkgdesc="Web Inspector based nodeJS debugger"
arch=(any)
url="http://github.com/node-inspector/node-inspector"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('3d07234f0834e7f1e21a1669eceaa224a7be43f2')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
