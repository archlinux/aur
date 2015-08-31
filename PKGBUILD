# Maintainer:  Boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

_npmname=node-forge
pkgname=nodejs-node-forge
pkgver=0.6.34
pkgrel=1
pkgdesc="JavaScript implementations of network transports, cryptography, ciphers, PKI, message digests, and various utilities"
arch=(any)
url="https://www.npmjs.com/package/node-forge"
license=( "GPLv2" )
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('b651976fdf4f7672b22a358d271c8adc')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
