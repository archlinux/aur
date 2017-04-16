# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Brock Whitten <brock@chloi.io>
# Contributor: Rob Ellis <rob@chloi.io>
# Contributor: Jorge Pedret <jorge@chloi.io>
# Contributor: Michael Brooks <michael@michaelbrooks.ca>
# Contributor: Tommy-Carlos Williams <tommy@devgeeks.org>
# Contributor: Darryl Pogue <darryl@dpogue.ca>
# Contributor: Boris Mann <boris@bmannconsulting.com>
# Contributor: Kenneth Ormandy <kenneth@chloi.io>
# Contributor: Keith Yao <i@yaofur.com>
# Contributor: sintaxi <brock@sintaxi.com>

_npmname=harp
_npmver=0.23.0
pkgname=nodejs-harp # All lowercase
pkgver=0.23.0
pkgrel=1
pkgdesc="Production ready web server with built in pre-processing"
arch=(any)
url="http://harpjs.com"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('5db8493f8074cdf9bd478d336de7328729f3ff0b')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
