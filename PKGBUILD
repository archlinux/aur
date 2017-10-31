# Maintainer: Hugues Chabot <at google mail>
_npmname=choo-cli
_npmver=2.1.0
pkgname=nodejs-choo-cli # All lowercase
pkgver=2.1.0
pkgrel=1
pkgdesc="create choo apps from the command line"
arch=(any)
url="https://github.com/trainyard/choo-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(c1d43e8a870ad4cc696b9eb9676dbff81e83a2ea)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
