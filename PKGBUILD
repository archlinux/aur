# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=jasmine-node
pkgname=nodejs-jasmine-node # All lowercase
pkgver=1.14.5
pkgrel=1
pkgdesc="DOM-less simple JavaScript BDD testing framework for Node"
arch=(any)
url="https://github.com/mhevery/jasmine-node"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('18e8397b856924ee77003666c3731b5aea50c39d')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
