# Maintainer: Hugues Chabot <at google mail>
_npmname=choo-cli
_npmver=1.0.0
pkgname=nodejs-choo-cli # All lowercase
pkgver=1.0.0
pkgrel=1
pkgdesc="create choo apps from the command line"
arch=(any)
url="https://github.com/trainyard/choo-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('55832d388a49fee11b93bccd8d4f78f3900c0398')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
