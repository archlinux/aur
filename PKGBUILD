_npmname=wikidata-cli
_npmver=4.8.2
pkgname=nodejs-wikidata-cli # All lowercase
pkgver=4.8.2
pkgrel=1
pkgdesc="The command-line interface to Wikidata"
arch=(any)
url="https://github.com/maxlath/wikidata-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
sha1sums=('a4b4cb190b728e6eb32b3b4185141bcbdc5eefc9')
sha512sums=('00db7a04b02e90a56352e63cfc174c5bdf1efd8e66306fb6a12a9e3dc30b423cc8f38927db4d26b86fa399c05a0b1cf032cd01558ee9c7b495e9bfb2a590d81c')
