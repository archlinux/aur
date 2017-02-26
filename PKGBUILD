_npmname=wikidata-cli
_npmver=4.6.0
pkgname=nodejs-wikidata-cli # All lowercase
pkgver=4.6.0
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
sha1sums=('f241590f1ccb08c5232615013d456d14b3c802eb')
sha512sums=('4bc55d51cc508f3350a8f024392d26f024e32c998805e6d236d841bbf3533fd6f85c5d60788a47bc31805be6d97e3791ad1c0d99771572122fecc862aa53c2d7')
