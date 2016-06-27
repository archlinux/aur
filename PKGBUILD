_npmname=gitter-cli
_npmver=0.8.5
pkgname=nodejs-gitter-cli # All lowercase
pkgver=0.8.5
pkgrel=1
pkgdesc="A gitter client for your console."
arch=(any)
url="https://github.com/RodrigoEspinosa/gitter-cli"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(4cb754520280b510909e82f343963b4e6509baba)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
