# Maintainer: David Peter <mail@david-peter.de>
_npmname=insect
_npmver=5.0.0
pkgname=insect
pkgver=5.0.0
pkgrel=1
pkgdesc="High precision scientific calculator with support for physical units"
arch=(any)
url="https://github.com/sharkdp/insect"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e46cabf9c37b4b4e5a716f2ed73b58f7f7bc68b2)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
