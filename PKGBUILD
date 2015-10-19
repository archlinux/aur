# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Einar Otto Stangvik <einaros@gmail.com> (http://2x.io)
# Contributor: einaros <einaros@gmail.com>
# Contributor: V1 <info@3rd-Eden.com>

_npmname=ws
_npmver=0.8.0
pkgname=nodejs-ws # All lowercase
pkgver=0.8.0
pkgrel=1
pkgdesc="simple to use, blazing fast and thoroughly tested websocket client, server and console for node.js, up-to-date against RFC-6455"
arch=(any)
url="http://github.com/einaros/ws"
license=( "MIT" )
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('ac60ebad312121d01e16cc3383d7ec67ad0f0f1f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
