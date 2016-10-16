# Maintainer: Hugues Chabot <at google mail>
_npmname=choo-cli
_npmver=0.8.0
pkgname=nodejs-choo-cli # All lowercase
pkgver=0.8.0
pkgrel=1
pkgdesc="create choo apps from the command line"
arch=(any)
url="https://github.com/trainyard/choo-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(5a0b5e103cf788089e2e3b9296a47a119da641a8)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
