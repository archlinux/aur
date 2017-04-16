# Maintainer: John D Jones III < jnbek1972 _+-^_AT_^-+_ gmail /|\-_-+_DOT_+-_-\|/ com

_npmname=generator-scalatra
_npmver=0.4.1
pkgname=nodejs-generator-scalatra # All lowercase
pkgver=0.4.1
pkgrel=1
pkgdesc="Generates a basic structure for Scalatra REST Application and includes Casbah for MongoDB if you wish."
arch=(any)
url="https://github.com/peter-vilja/generator-scalatra"
license=('MIT')
depends=('npm' 'nodejs-yeoman')
optdepends=(
  'scala: Scala Programming Language'
  'sbt: Scala Build Tool'
  'mongodb: Casbah Support'
)
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('67636feb7c50ededea6edb97357ced43f5cfecc1')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
