# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
_npmname=feathers-cli
_npmver=2.0.5
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="The command line interface for Feathers applications"
arch=(any)
url="https://github.com/feathersjs/feathers-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('164ace795ca4b17323c442ac22813ce6cdcc324b')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
